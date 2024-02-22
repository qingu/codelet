module mytypes
  type :: mydata
    real, dimension(:), pointer :: px
  contains
    procedure :: init
    ! finalizer
    final :: mydata_release_px
  end type
contains
  subroutine init(data,n)
    class(mydata) :: data
    integer,intent(in) :: n
    
    allocate(data%px(n))
    print*, "init object allocation",n
  end subroutine init
  subroutine mydata_release_px( data )
    type(mydata) :: data
    print*,"entering mydata_release_px",size(data%px)
    deallocate( data%px )
    print*,"exiting mydata_release_px"
  end subroutine mydata_release_px
  subroutine printme()
    type(mydata) :: data
    call init(data,5)
    print*,"entering printme",size(data%px)
  end subroutine printme
end module mytypes

program main
  use mytypes
  implicit none
  type(mydata) :: v1
  type(mydata),pointer :: v2

  call v1%init(1)
  allocate(v2)
  call v2%init(2)
  deallocate(v2)
  ! block construct
  block
      ! local scope
      type(mydata) :: v3
      call v3%init(3)
  end block
  call printme()
end
  

