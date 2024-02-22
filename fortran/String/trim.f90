program main
  implicit none
  character(len=128) :: str

  str = "        hello world       "

  print*,str
  print*,trim(str)
  print*,adjustl(str)
  print*,adjustr(str)

end
