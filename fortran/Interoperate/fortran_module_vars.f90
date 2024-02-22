module global
  use ISO_C_BINDING,only: C_DOUBLE
  implicit none
  !real(C_DOUBLE),bind(C,name="PI") :: PI = atan(1.0)*4.0
  !real(C_DOUBLE),bind(C) :: PI = atan(1.0)*4.0
  real(C_DOUBLE) :: PI = atan(1.0)*4.0
end module global
