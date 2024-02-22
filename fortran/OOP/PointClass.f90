! Purpose: leran class definition,call class's method and operator overloading
module PointClass
  type,public :: Point
    real(8) :: x,y
  contains
    procedure,public :: distance,add,printme
  end type Point
  ! operator overloading
  interface operator(+)
    module procedure add
  end interface operator(+)
contains
  real(8) function distance(this,that)
    implicit none
    class(Point) :: this
    class(Point) :: that

    distance = sqrt((that%x-this%x)**2 + (that%y-this%y)**2)
  end function distance
  ! return type use type() not class type
  type(Point) function add(this,that) result(total)
    implicit none
    ! parameters need to be intent(in) for operator overloading
    class(Point),intent(in) :: this
    class(Point),intent(in) :: that

    total%x = this%x + that%x
    total%y = this%y + that%y
  end function add
  subroutine printme(this)
    implicit none
    class(Point) :: this

    print*, "value is",this%x, this%y
  end subroutine printme
end module PointClass

program test
  use PointClass
  implicit none
  type(Point) :: p1,p2,sum

  ! type initializer
  p1 = point(1.d0,1.d0)
  p2 = point(4.d0,5.d0)
  print*,"Distance:",p1%distance(p2)

  ! use method of class
  sum = p1%add(p2)
  call sum%printme()

  ! operator overloading
  sum = p1 + p2
  call sum%printme()

end program test
