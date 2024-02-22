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
  subroutine which_type(data)
    implicit none
    class(mytype) :: data

    select type (data)
      type is (mytype)
          print*, 'actual arg is mytype'
      class is (mytype)
          print*, 'dynamic type'
      type is (mynewtype)
          print*, 'actual arg is mynewtype'
    end select
  end subroutine which_type

end module mytypes

program test
  use mytypes
  implicit none
  type(mytype) :: v
  type(mynewtype) :: v_new

  v = mytype(2)
  print*,'Init value of mytype is ',v%value
  call v%write(10)
  print*,'Write value of mytype is ',v%value

  v_new = mynewtype(3, 2.0)
  print*,'Init value of mynewtype is ',v_new%value,v_new%extra

  print*,'Parent value is ',v_new%mytype%value
  call v_new%write(5)

  call which_type(v)
  call which_type(v_new)
end

