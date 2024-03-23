program main
  implicit none
  real*4 :: res_uflow, res_oflow
  real*4 :: res_dbyz, res_inv 
  real*4 :: res
  real*4 :: small, big, zero, scale

  small = 1.0e-30
  big   = 1.0e30
  zero  = 0.0
  scale = 1.0e-10

  ! IEEE underflow
  res_uflow = small * scale
  write(0,*) "Underflow: ",small, " * ",scale, " = ", res_uflow

  ! IEEE overflow
  res_oflow = big * big
  write(0,*) "Overflow: ",big, " * ",big, " = ", res_oflow

  ! IEEE divide-by-zero
  res_dbyz = -big / zero
  write(0,*) "Div-by-zero: ",-big, " / ",zero, " = ", res_dbyz

  ! IEEE invalid operation
  res_inv = zero / zero
  write(0,*) "Invalid: ",zero, " / ",zero, " = ", res_inv

  ! res = sqrt(-1.0)   ! log(x) if x <= 0; asin(x) if x<-1 or x>1
  ! write(0,*) "Invalid: sqrt(-1.0)", res

end
