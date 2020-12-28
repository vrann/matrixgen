Program MatrixReader

    integer M
    integer N
    real * 8, allocatable, dimension(:,:) :: A

    OPEN(234, FILE="test-out.bin", STATUS='OLD', ACCESS="STREAM")
    READ(234, pos=1) M
    READ(234, pos=5) N

    write (*, * ) M, N


    allocate (A(M,N))

    READ(234) A
    write (*, * ) A
    CLOSE (234)

end
