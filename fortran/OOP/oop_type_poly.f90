! Purpose: learn type ploymorphism and constructor simulatation
module series_mod
    implicit none

    type Series
    contains
       procedure :: printSeries
    end type

    type, extends(Series) :: SeriesInt
        integer, allocatable :: data(:)
      contains
        procedure :: printSeries => print_int
    end type

    ! simulate Class Constructor
    ! overridding Series constructor
    interface Series
        module procedure init_int
    end interface

contains

    subroutine printSeries(self)
      class(Series), intent(in) :: self
      ! do whatever you want with default implementation
    end subroutine

    function init_int(data) result(self)
        type(SeriesInt) :: self
        integer, intent(in) :: data(:)

        print*, "calling init_int"
        self%data = data
    end function

    subroutine print_int(self)
        class(SeriesInt), intent(in) :: self
        print *, self%data
    end subroutine
end module

program test
    use series_mod, only: Series, SeriesInt
    implicit none
    ! type ploymorphism
    class(SeriesInt), allocatable :: s1
    class(Series),    allocatable :: s2

    s1 = Series([1,2,3,4])
    s2 = Series([5,6,7,8])
    call s1%printSeries()
    call s2%printSeries()
end program test
