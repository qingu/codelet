module f_func
  use ISO_C_BINDING,only: C_INT
  implicit none
contains
  integer(C_INT) function add_v(a,b) BIND(C)
    implicit none
    integer(C_INT),value,intent(in) :: a,b

    add_v  = a + b
  end function add_v
  integer(C_INT) function add_p(a,b) BIND(C)
    implicit none
    integer(C_INT),intent(in) :: a,b

    add_p  = a + b
  end function add_p 
end module f_func
