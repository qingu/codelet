program main
  implicit none
  integer,parameter :: N = 5
  integer :: arr1(6),i


  ! method 1
  arr1 = (/1,2,2,2,2,2/)
  print*, 'arr1=',arr1
  ! method 2
  arr1 = (/1,(3, i=1,N)/)
  print*, 'arr1=',arr1
end
