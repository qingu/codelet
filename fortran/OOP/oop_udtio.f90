module my_mod
type t
   integer :: x
   integer, private :: y
end type t
end module my_mod
program prg1
use my_mod
type(t) :: obj
write(*,*) obj   ! Illegal due to private y
end
