program main
  implicit none
  integer,dimension(5) :: a,b
  logical,dimension(5) :: mask

  a = 1
  b = 2
  mask = (/.false.,.true.,.false.,.true.,.false./)

  print*, merge(a,b,mask(1))
  print*, merge(a,b,mask)
end
