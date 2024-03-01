program main
  use mpi
  implicit none
  real,allocatable,dimension(:) :: send_buf
  real,allocatable,dimension(:,:) :: recv_buf
  integer :: nsize,ntasks,mytask,ierr,i,n
  integer :: status(MPI_STATUS_SIZE)
  

  call mpi_init(ierr)
  call mpi_comm_size(MPI_COMM_WORLD,ntasks,ierr)
  call mpi_comm_rank(MPI_COMM_WORLD,mytask,ierr)
  nsize = 1024
  allocate(send_buf(nsize))
  if(mytask == 0) then
    allocate(recv_buf(nsize,0:ntasks-1))
  else
    allocate(recv_buf(1,1))
  endif

  call random_number(send_buf)
  if(mytask == 0) then
    recv_buf(:,0) = send_buf(:)
    do i=1,ntasks-1
      call mpi_recv(recv_buf(:,i),nsize,MPI_REAL,i,999,MPI_COMM_WORLD,status,ierr)
    enddo
  else
    call mpi_send(send_buf,nsize,MPI_REAL,0,999,MPI_COMM_WORLD,ierr)
  endif
  if(mytask == 0) print*,recv_buf(1,1)

  deallocate(send_buf)
  deallocate(recv_buf)
  call mpi_finalize(ierr)
end



