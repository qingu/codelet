module decomp_info
  implicit none
contains
  logical function allowed_process_num(ntasks,cores_of_one_node)
    implicit none
    integer,parameter  :: ntiles = 6
    integer,intent(in) :: ntasks
    ! cores_of_one_node: require all cores of the node to be utilized
    integer,optional,intent(in) :: cores_of_one_node  
    integer :: factors(3),iter,i
    logical :: changed
  
    factors(1:3)=[2,3,5]
  
    if(ntasks == 1) then
      allowed_process_num = .true.
      return
    endif
  
    if(mod(ntasks,ntiles) /= 0) then
      allowed_process_num  = .false.
      return
    endif
  
    if(present(cores_of_one_node)) then
      if(mod(ntasks,cores_of_one_node) /= 0) then
        allowed_process_num  = .false.
        return
      endif
    endif
  
    changed = .true.
    iter = ntasks
    do while(changed)
      changed = .false.
      do i=1,3
        if(mod(iter,factors(i)) == 0) then
          changed = .true.
          iter = iter / factors(i)
        endif 
      enddo
    enddo
    if(iter == 1) then
      allowed_process_num = .true.
    else
      allowed_process_num = .false.
    endif
    return
  end function allowed_process_num
end module decomp_info

program main
  use decomp_info
  implicit none

  integer :: i,cores_node
  logical :: allowed

  cores_node = 64  ! one node has 64 cores
  do i=1,100000
    allowed = allowed_process_num(i,cores_node)
    if(allowed) print*, "num of tasks = ",i," allowed"
  enddo
end
  

  
