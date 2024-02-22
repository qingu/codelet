module ddt 
  implicit none
  type,bind(c) :: mytype
    integer :: ddt_start
    integer :: a
    character(len=1) :: b(10)
    real :: c
    integer :: ddt_end
  end type
end module ddt

program main
  use iso_c_binding
  use ddt
  implicit none
  type(mytype),target :: v,v1
  type(C_PTR) :: cptr
  integer(C_INTPTR_T) :: addr1,addr2
  character(len=:,kind=C_CHAR),pointer :: fp

  v = mytype(1,2,"0123456789",3.0,4)
  print*,v%ddt_start,v%a,v%c
  cptr = c_loc(v)
  addr1 = transfer(cptr,addr1)
  print*,cptr
  cptr = c_loc(v%ddt_start)
  print*,cptr
  cptr = c_loc(v%ddt_end)
  addr2 = transfer(cptr,addr2)
  print*,cptr
  print*,addr2-addr1
block
    character(len=(addr2-addr1+4),kind=C_CHAR),pointer :: temp
    call C_F_POINTER(c_loc(v),temp)
    fp => temp 
end block
   v1 = transfer(fp,v1)
   print*,v1%c,v1%ddt_end

   print*,sizeof(v1)
   print*,storage_size(v1)
end 
