! Purpose: use C pointer and transfer intrinsic function
program main
  use mpi
  use iso_c_binding
  implicit none
  type,bind(c) :: ddt_t
    integer   :: a 
    real      :: b 
    character :: c
  end type ddt_t
  type(ddt_t),target :: mytype
  integer :: ntasks,me,ierr,nbytes
  character(len=:,kind=C_CHAR),pointer :: fp
  type(C_PTR) :: cp

  call mpi_init(ierr)
  call mpi_comm_rank(MPI_COMM_WORLD,me,ierr)

  ! root proc ddt initialize
  if(me == 0) then 
    mytype = ddt_t(1,2.0,'a')
  endif

  ! get ddt's size
  !nbytes = sizeof(mytype)  
  ! or
  nbytes = c_sizeof(mytype) ! c_sizeof need interoperatable type, bind(c) can meet this requirement
  ! or
  !nbytes = storage_size(mytype) / 8
  if(me == 0) print*, "mytype occupy space",nbytes

  ! get ddt's c pointer address
  cp = c_loc(mytype)

  block
    ! temporary fortran pointer 
    character(len=nbytes,kind=C_CHAR),pointer :: temp 
    call c_f_pointer(cp, temp)
    fp => temp
  end block

  call mpi_bcast(fp,nbytes,MPI_CHARACTER,0,MPI_COMM_WORLD,ierr)

  ! fortran character pointer type cast into derived type
  mytype = transfer(fp, mytype)

  print*, me," task's mytype ",mytype

  call mpi_finalize(ierr)
end

