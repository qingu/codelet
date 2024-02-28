program main
  implicit none

  print*, "HUGE(0_2)=",huge(0_2)  ! 2**15-1
  print*, "HUGE(0)=",huge(0)      ! 2**31-1
  print*, "HUGE(0._4)=",huge(0._4)
  print*, "HUGE(0._8)=",huge(0._8)

  print*, "RADIX(0)=",radix(0)
  print*, "RADIX(0.)=",radix(0.)

  print*, "SPACING(0._4)=",spacing(0._4)
  print*, "SPACING(0._8)=",spacing(0._8)

  print*, "PRECISION(0._4)=",precision(0._4),"RANGE(0._4)=",range(0._4)
  print*, "PRECISION(0._8)=",precision(0._8),"RANGE(0._8)=",range(0._8)
end
