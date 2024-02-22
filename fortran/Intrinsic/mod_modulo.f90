program main
  implicit none

  print*, mod(17,3)
  print*, mod(-17,3)
  print*, mod(17,-3)
  print*, mod(-17,-3)
  print*, mod(17.,3.)

  print*, modulo(17,3)
  print*, modulo(-17,3)
  print*, modulo(17,-3)
  print*, modulo(-17,-3)
  print*, modulo(17.,3.)
end

