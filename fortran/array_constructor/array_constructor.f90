program main
  implicit none
  integer,parameter :: N = 5
  integer,dimension(N) :: a1,a2,a3
  integer,dimension(N*3) :: a4
  integer :: i
  integer,allocatable :: a5(:)
  integer,dimension(3,5) :: a6
  integer,dimension(5,3) :: a7


  ! scalar expression
  a1 = (/1,2,3,4,5/)
  print*,'a1 = ',a1

  ! array expression
  a2 = (/a1(1:5)-10/)
  print*,'a2 = ',a2

  ! implied-do loop
  a3 = (/(j, integer :: j=6, 10)/)
  print*,'a3 = ',a3

  ! mixing form
  a4 = [-1,-2,a1,(i+7,i=1,5),0,1,2]
  print*,'a4 = ',a4

  allocate(a5(0))
  print*,"allocated(a5)=",allocated(a5)
  a5 = [ integer :: ]
  print*,'T1:size(a5) = ',size(a5)
  a5 = [a1]
  print*,'T2:size(a5) = ',size(a5)
  print*,'a5 =',a5
  a5 = [a1,a5]
  print*,'a5 =',a5

  a6 = reshape(a4,shape=shape(a6))
  print*,'a6 = ',a6
  print*,shape(a6)
  ! change Fortran array order to C order
  a7 = reshape(a6,shape=shape(a7),order=(/2,1/))
  print*,'C order a7= ',a7
end
