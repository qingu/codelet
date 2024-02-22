module mytypes
  implicit none
  type mytype
    integer :: value
  contains
    procedure,public :: write => write_mytype
  end type mytype

  type, extends(mytype) :: mynewtype
    real :: extra
  contains
    ! overriding method in extending type
    procedure,public :: write => write_mynewtype
  end type mynewtype
contains
  subroutine write_mytype(v, lun)
    class(mytype) :: v  !Note: "class" not "type"
                        !this allow extension
    integer,intent(in) :: lun

    print*, "use mytype method"
    v%value = lun
  end subroutine write_mytype
  subroutine write_mynewtype(v, lun)
    class(mynewtype) :: v  !Note: "class" not "type"
                      !this allow extension
    integer,intent(in) :: lun
    print*, "use mynewtype method"
    call v%mytype%write(lun) !Invoke the parent's routine
  end subroutine write_mynewtype
end module mytypes

program main
  use mytypes
  implicit none
  type(mynewtype) :: v_new

  v_new = mynewtype(2,3.0)
  call v_new%write(7)
end 
