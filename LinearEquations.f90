Program LinearEquations
! solving the matrix equation A*x=b using LAPACK
  implicit none

  integer, PARAMETER :: M = 5

  integer, dimension(4) :: iseed
  real * 8, dimension(M, M) :: A, B, C
  real * 8, dimension(3, 3) :: ATEST, CTEST, BTEST
  real * 8, dimension(M) :: D
  integer MODE
  real * 8 COND
  real * 8 DMAX
  real * 8, dimension(M) :: DL
  real * 8, dimension(M) :: DR
  integer, dimension(M) :: IPIVOT, IWORK
  integer :: INFO, i, j, KU, KL




!  ATEST = reshape((/4, 12, -16, 12, 37, -43, -16, -43, 98/), (/3, 3/))
!  call DPOTRF('U', 3, ATEST, 3, INFO)
!
!
!
!
!  do, i = 1,3
!    do, j = 1,3
!       CTEST(i, j) = 0
!       if (j.lt.i) then
!         ATEST(i, j) = 0
!       end if
!    enddo
!  enddo
!
!  BTEST = transpose(ATEST)
!
!  do, i = 1, 3
!    write(*, *) (ATEST(i,j), j=1,3)
!  enddo
!
!  do, i = 1, 3
!    write(*, *) (BTEST(i,j), j=1,3)
!  enddo
!
!  do, i = 1, 3
!    write(*, *) (CTEST(i,j), j=1,3)
!  enddo
!
!  !  C := alpha*op( A )*op( B ) + beta*C,
!  call DGEMM('N', 'N', 3, 3, 3, 1.d0, BTEST, 3, ATEST, 3, 0.d0, CTEST, 3)
!
!  do, i = 1, 3
!    write(*, *) (CTEST(i,j), j=1,3)
!  enddo
!
!  do, i = 1, 3
!    write(*, *) (ATEST(i,j), j=1,3)
!  enddo


  iseed = (/2, 3 , 5, 7/)
  !D = (/1, 2, 3, 4, 5/)
  MODE = 5
  COND = 103.0
  DMAX = 107.8
  !DL = (/0, 0, 0, 0, 0/)
  !DR = (/0, 0, 0, 0, 0/)
  !IPIVOT = (/0, 0, 0, 0, 0/)
  KL = M-1
  KU = M-1

  do i = 1, M
    do j = 1, M
      A(i, j) = 0.0
      C(i, j) = 1.0
    end do
  end do

  call DLATMR(&
    M,      &!M
    M,      &!N
    'S',    &!DIST
    iseed,  &!ISEED
    'S',    &!SYM
    D,      &!D
    MODE,   &!MODE
    COND,   &!COND
    DMAX,   &!DMAX
    'F',    &!RSIGN
    'N',    &!GRADE
    DL,     &!DL
    0,      &!MODEL
    0.0,    &!CONDL
    DR,     &!DR
    0,      &!MODER
    0.0,    &!CONDR
    'N',    &!PIVTING
    IPIVOT, &!IPIVOT
    KL,     &!KL
    KU,     &!KU
    0.0,     &!SPARSE
    -1.0,   &!ANORM
    'N',    &!PACK
    A,      &!A
    M,      &!LDA
    IWORK,  &!IWORK
    INFO)   !INFO
  
!  write(*, *) INFO
!  do i = 1, M
!    do j = 1, M
!      write(*,*) A(i, j)
!    end do
!  end do

  do, i = 1, M
    write(*, *) (A(i,j), j=1,M)
  enddo

  OPEN(234, FILE="matrix-0-0.bin", FORM='UNFORMATTED', STATUS='REPLACE', ACCESS="STREAM")
  WRITE(234) M
  WRITE(234) M
  WRITE(234) A
  CLOSE (234)

!  do i = 1, M
!    write(*,*) D(i)
!  end do
!
!  call DPOTRF('U', M, A, M, INFO)
!
!
!
!  write(*, *) INFO
!
!  do, i = 1, M
!    write(*, *) (A(i,j), j=1,M)
!  enddo
!
!!  B = transpose(A)
!!!
!!  do, i = 1, M
!!    write(*, *) (B(i,j), j=1,M)
!!  enddo
!
!!  C := alpha*op( A )*op( B ) + beta*C,
!   call DGEMM('T', 'N', M, M, M, 1.d0, A, M, A, M, 0.d0, C, M)
!
!   do, i = 1, M
!    write(*, *) (C(i,j), j=1,M)
!   enddo



!  write (*, *) iseed
end
