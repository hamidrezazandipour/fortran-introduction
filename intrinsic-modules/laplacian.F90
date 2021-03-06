program laplacian
  implicit none


  ! TODO all floating point numbers should be
  ! double precision

  integer, parameter :: nx = 10, ny = 10
  real, parameter :: dx = 0.01, dy=0.01

  ! arrays include also boundary layers at 0 and nx/y + 1
  real, dimension(0:nx+1, 0:ny+1) :: A, L

  real :: x, y
  integer :: i, j

  ! TODO write out the compiler version and compiler options

  ! initialize array to x^2 + y^2
  ! origo is in the center of the grid so we shift by (nx/y + 1) / 2
  do j = 0, ny + 1
     y = (j - (ny + 1) / 2.0) * dy
     do i = 0, nx + 1
        x = (i - (nx + 1) / 2.0) * dx
        A(i,j) = x**2 + y**2
        L(i,j) = 0.0
     end do
  end do

  ! evaluate the laplacian excluding the boundaries
  do j = 1, ny
     do i = 1, nx
        L(i,j) = (A(i-1,j) - 2.0*A(i,j) + A(i+1,j)) / dx**2 + &
             (A(i,j-1) - 2.0*A(i,j) + A(i,j+1)) / dy**2
     end do
  end do

  ! print out the arrays
  write(*,*) "Original array:"
  do i = 1, nx
     write(*,'(*(G9.1))') A(i,1:ny)
  end do

  write(*,*) "Laplacian of the array:"
  do i = 1, nx
     write(*,'(*(G9.1))') L(i,1:ny)
  end do

end program laplacian
