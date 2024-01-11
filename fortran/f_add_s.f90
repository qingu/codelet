module  string_op
  implicit none
contains
  subroutine add_s1(s1,s2)
    character(len=*) :: s1,s2
  
    print*,trim(s1)//trim(s2)
  end subroutine add_s1
  subroutine add_s2(s1,s2) BIND(C)
    use ISO_C_BINDING,only:c_char
    character(c_char) :: s1(*),s2(*)
  
    !print*,trim(s1)//trim(s2)
    print*,s1(1),s2(1)
  end subroutine add_s2
end module string_op

program main
  use string_op
  implicit none

  call add_s1("hello","world")
  call add_s2("hello","world")
end
