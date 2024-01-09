module generic_example
  implicit none
  interface add
    module procedure iadd
    module procedure radd
    module procedure cadd
  end interface
contains
  integer function iadd(a,b) result(c)
    implicit none
    integer,intent(in) :: a,b

    c = a + b
  end function iadd
  real function radd(a,b) result(c)
    implicit none
    real,intent(in) :: a,b

    c = a + b
  end function radd
  !character(len=100) function cadd(a,b) result(c)
  function cadd(a,b) result(c)
    implicit none
    character(len=*),intent(in) :: a,b
    character(len=:),allocatable :: c

    c = trim(a) // trim(b)
  end function cadd
end module generic_example

program main
  use generic_example
  implicit none

  print*, add(3,5)
  print*, add(3.0,5.2)
  print*, add("hello","world")
  print*, add("hello             ","                    world")
end 
