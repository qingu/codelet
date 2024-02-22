program main
  implicit none
  character :: c

  c = '0'
  print*,ichar(c)
  print*,char(ichar(c))
  print*,iachar(c)
  print*,achar(iachar(c))
end
