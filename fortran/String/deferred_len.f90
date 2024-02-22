module str_mod
  implicit none
contains
  function join(str_a, str_b)
    implicit none
    !assumed-length character type dummy
    character(len=*),intent(in) :: str_a,str_b
    ! deferred-length character, dynamic type
    character(len=:),allocatable :: join
  
    join = str_a // ' ' // str_b
  end function join
end module str_mod

program main
  use str_mod
  implicit none
  !assumed-length character parameter
  character(len=*),parameter :: a = "hello world!"
  character(len=12) :: b

  b = "I am a coder"
  print*,"new string size is ",len(join(a,b))
  print*,"new string is ",join(a,b)
end

  
