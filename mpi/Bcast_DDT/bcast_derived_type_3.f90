! Purpose: use MPI ddt support
program main
  use mpi
  use iso_c_binding
  implicit none
  ! need bind(c) or sequence attribute 
  ! DDT's components should not have pointer or alloctable attribute
  type,bind(C) :: ddt_t
    integer   :: a 
    real      :: b 
    character :: c
  end type ddt_t
  type(ddt_t) :: mytype
  integer :: ntasks,me,ierr,nbytes
  integer(kind=MPI_ADDRESS_KIND) :: disp(3),base,lb,extent
  integer :: blocklen(3),mpitype(3),newtype

  call mpi_init(ierr)
  call mpi_comm_rank(MPI_COMM_WORLD,me,ierr)

  ! root proc ddt initialize
  if(me == 0) then 
    mytype = ddt_t(1,2.0,'a')
  endif

  call mpi_get_address(mytype%a, disp(1),ierr)
  call mpi_get_address(mytype%b, disp(2),ierr)
  call mpi_get_address(mytype%c, disp(3),ierr)

  base = disp(1)
  disp(1) = disp(1) - base
  disp(2) = disp(2) - base
  disp(3) = disp(3) - base

  blocklen(:) = 1

  mpitype(1) = MPI_INTEGER
  mpitype(2) = MPI_REAL
  mpitype(3) = MPI_CHARACTER

  call mpi_type_create_struct(3,blocklen,disp,mpitype,newtype,ierr)
  call mpi_type_commit(newtype,ierr)

  call mpi_bcast(mytype,1,newtype,0,MPI_COMM_WORLD,ierr)

  print*, me," task's mytype ",mytype

  call mpi_finalize(ierr)
end

