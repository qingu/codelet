function F(x)
   implicit none
   character(*) F   !assumed length character
   character x(:)
   integer i
   do i = 1, len(F)
      F(i:i) = x(1)
   end do
end function F

program blox1
   implicit none
   integer i
   character c
   do i = 1, 7
      c = achar(65+modulo(i**4+6*i**2+1,26))
      block
         character(2*i+1), external :: F
         call blox1a(F)  ! F is a function
      end block
   end do
   contains
      subroutine blox1a(F)
         interface
            function F(x)
               import
               implicit none
               character(2*i+1) F
               character x(:)
            end function F
         end interface
         write(*,'(a)') F([c])
      end subroutine blox1a
end program blox1
