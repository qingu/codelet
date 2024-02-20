program main
  use mpi
  implicit none
  type ddt_t
    integer   :: a 
    real      :: b 
    character :: c
  end type ddt_t
  type(ddt_t) :: mytype
  integer :: ntasks,me,ierr

  call mpi_init(ierr)
  call mpi_comm_rank(MPI_COMM_WORLD,me,ierr)

  if(me == 0) then 
    mytype = ddt_t(1,2.0,'a')
  endif

  call mpi_finalize(ierr)
end

