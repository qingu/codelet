program main
  use iso_c_binding
  implicit none
  integer :: a(10)
  type :: mytype
    integer :: a
    !real,pointer :: b(:)
  end type 
  type(mytype) :: v

  print*,storage_size(a)
  print*,sizeof(a)
  print*,c_sizeof(a)

  !allocate(v%b(10))
  print*,storage_size(v)
  print*,sizeof(v)
end
