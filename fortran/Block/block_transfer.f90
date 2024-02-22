program blox3
   use ISO_C_BINDING
   implicit none
   character(len=:,kind=C_CHAR), allocatable, target :: x
   type(C_PTR) c_hello,cc    ! C pointer
   integer(C_INTPTR_T) address
   character(kind=C_CHAR), pointer :: nul_address
   character(len=:,kind=C_CHAR), pointer :: f_hello
   integer i

   x = 'Hello, world'//achar(0)
   print*,len(x)
   c_hello = C_LOC(x(1:1))  ! get x's c address
   address = transfer(c_hello,address) ! casting type into another
   cc = C_LOC(x(10:10))
   print*,'address ',c_hello,address,transfer(cc,address)-address
   i = 0
   do
      ! 
      call C_F_POINTER(transfer(address+i,C_NULL_PTR),nul_address)
      print*,i,address+i,nul_address,C_NULL_PTR,C_NULL_CHAR
      if(nul_address == C_NULL_CHAR) exit
      i = i+1
   end do
BLOCK
   character(len=i,kind=C_CHAR), pointer :: temp
   call C_F_POINTER(c_hello,temp) ! c pointer => fortran pointer
   f_hello => temp
END BLOCK
write(*,'(i0,1x,a)') len(f_hello), f_hello
end program blox3
