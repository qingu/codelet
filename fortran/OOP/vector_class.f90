module vector_mod
  implicit none
  type VectorField
    real(8),allocatable,dimension(:) :: value
  contains
    procedure,public :: setlinear,setconstant,alloc,&
                        printme
  end type VectorField
  interface operator(+)
    module procedure :: add
  end interface operator(+)
contains
  subroutine alloc(this, size)
    implicit none
    class(VectorField) :: this
    integer,intent(in) :: size

    if(allocated(this%value)) deallocate(this%value)
    allocate(this%value(size))
  end subroutine alloc

  subroutine setconstant(this, v)
    implicit none
    class(VectorField) :: this
    real(8),intent(in) :: v

    if(.not. allocated(this%value)) STOP "object%value not allocated"

    this%value(:) = v
  end subroutine setconstant

  subroutine setlinear(this)
    implicit none
    class(VectorField) :: this
    integer :: i

    if(.not. allocated(this%value)) STOP "object%value not allocated"
    
    do i=1,size(this%value)
      this%value(i) = i*1.0D0
    enddo
  end subroutine setlinear

  type(VectorField) function add(v1,v2) result(out)
    implicit none
    class(VectorField),intent(in) :: v1,v2

    call out%alloc(size(v1%value))
    out%value(:) = v1%value(:) + v2%value(:)
  end function add

  subroutine printme(this)
    implicit none
    class(VectorField),intent(in) :: this

    print*, this%value(:)
  end subroutine printme
end module vector_mod

program test
  use vector_mod
  implicit none
  integer,parameter :: sz = 12

  type(VectorField) :: u,v,z

  call u%alloc(sz)
  call v%alloc(sz)
  call u%setlinear()
  call v%setconstant(1.d0)

  z = u + v
  call z%printme()
end

