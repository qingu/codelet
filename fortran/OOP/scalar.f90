module mod_a
  implicit none
  !class declar as a type with contains clause
  ! followed by procedure declaration
  !Fortran class based on type objects
  type Scalar
    !data member
    real(4) :: value
  contains
    !method declar in contains clause
    procedure,public :: printme,scaled
  end type Scalar
contains
  !actual methods definition
  subroutine printme(me)
    implicit none
    !object itself as extra parameter
    !declar as class for polymorphism
    class(Scalar) :: me
    print '("The value is", f7.3)',me%value
  end subroutine printme
  function scaled(me,factor)
    implicit none
    class(Scalar) :: me
    real(4) :: scaled,factor

    scaled = me%value * factor
  end function scaled
end module mod_a

program main
  use mod_a
  implicit none

  type(Scalar) :: x
  real(4) :: y
  !intialize object and data member should not be private
  x = Scalar(-3.14)
  !object itself as first implicit parameter like this pointer in C++
  call x%printme()
  y = x%scaled(2.)
  print '(f7.3)',y
end program main
