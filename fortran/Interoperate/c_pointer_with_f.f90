program main
  use iso_c_binding
  implicit none
  interface
    subroutine print_c(arr) 
      use iso_c_binding,only:c_ptr
      type(c_ptr),intent(in) :: arr
    end subroutine print_c
  end interface
  type(c_ptr) :: cptr1, cptr2
  integer, target :: array(7), scalar
  integer, pointer :: pa(:), ps
  integer :: i
  cptr1 = c_loc(array(1)) ! The programmer needs to ensure that the
                          ! array is contiguous if required by the C
                          ! procedure
  cptr2 = c_loc(scalar)
  print*, cptr1,cptr2
  
  do i=1,7
    array(i) = i
  enddo
  print*,array
  !call print_c(cptr1)
  
  call c_f_pointer(cptr2, ps)
  call c_f_pointer(cptr1, pa, shape=[7])
  print*,pa(:)
  end
