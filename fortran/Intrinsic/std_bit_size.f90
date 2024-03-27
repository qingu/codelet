program main
  implicit none
  integer :: i
  
  print*, bit_size(1_2)
  print*, bit_size(1_4)
  print*, bit_size(1_8)

  do i=0,bit_size(7)-1
    print*, 'bit of ',i,'value ',btest(7,i)
  enddo
end
