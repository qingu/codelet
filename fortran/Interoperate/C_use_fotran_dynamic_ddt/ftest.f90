! @file test.f90
! Fortran side code
module typedef
  use iso_c_binding
  type :: my_type
    real(c_double), pointer :: my_data(:)
  end type my_type
end module typedef

subroutine c_opaque_alloc(c_obj, n)
  use typedef
  implicit none
  integer(c_int), intent(in) :: n
  type(my_type) :: c_obj
  allocate(c_obj%my_data(n))
end subroutine c_opaque_alloc

subroutine c_opaque_free(c_obj)
  use typedef
  implicit none
  type(my_type) :: c_obj
  deallocate(c_obj%my_data)
end subroutine c_opaque_free

subroutine c_storage_size( my_size )
  use typedef
  implicit none
  type(my_type) :: dummy_obj
  integer(c_int) :: my_size
  ! key point
  my_size = STORAGE_SIZE(dummy_obj, c_int)
  my_size = my_size / 8 ! return size in bytes
  print*, 'sizeof(my_type)= ',my_size
end subroutine c_storage_size
