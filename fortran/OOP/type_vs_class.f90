module mytypes
  implicit none
  type mytype
    integer :: value
  contains
    procedure,public :: write => write_mytype
  end type mytype

contains
  subroutine write_mytype(v, lun)
    type(mytype) :: v  !Note: "class" not "type"
                      !this allow extension
    integer,intent(in) :: lun

    v%value = lun
  end subroutine write_mytype
end module mytypes



program test
  use mytypes
  implicit none
  type(mytype) :: v

  v = mytype(2)
  print*,'Init value of mytype is ',v%value
  call v%write(10)
  print*,'Write value of mytype is ',v%value

end

