module test
  implicit none
contains
  subroutine add(a,b,c,len)
    implicit none
#if GCC
!GCC$ ATTRIBUTES NO_ARG_CHECK :: a,b,c
#elif INTEL
!DEC$ ATTRIBUTES NO_ARG_CHECK :: a,b,c
#elif PGI
!DIR$ IGNORE_TKR a,b,c
#endif
    real,dimension(*) :: a,b,c
    integer :: len
    !local
    integer :: i
    
    print*,len
    do i=1,len
      a(i)=b(i)+c(i)
    enddo
  end subroutine add
end module test
program main
  use test
  implicit none
  integer,dimension(10) :: a1,b1,c1
  real,dimension(10,10) :: a2,b2,c2

  b1 = 2
  c1 = 3
  call add(a1,b1,c1,size(a1))
  print*,"a1=",a1
  b2 = 2
  c2 = 3
  call add(a2,b2,c2,size(a2))
end

