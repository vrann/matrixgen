# MATRIXGEN

## Installation

1. Install gfortran `brew install gfortran`
2. Download lapack-3.8.0 https://github.com/Reference-LAPACK/lapack/releases/tag/v3.8.0 and unpack
3. Compile Lapack Testing Matgen
- ``> cd ../lapack-3.8.0``
- ``> cp -rf make.inc.example make.inc``
- (For gcc 10 only) edit make.inc add ``-fallow-argument-mismatch`` to OPTS: 
```
FORTRAN = gfortran
OPTS    = -O2 -frecursive -fallow-argument-mismatch
```
- ``> cd TESTING/MATGEN``
- ``> make``

3. Compile reader and writer
```
gfortran ../lapack-3.8.0/TESTING/MATGEN/*.o MatrixReader.f90 -o reader -llapack -lblas -ffree-line-length-512 -g -fcheck=all -Wall
gfortran ../lapack-3.8.0/TESTING/MATGEN/*.o LinearEquations.f90 -o writer -llapack -lblas -ffree-line-length-512 -g -fcheck=all -Wall
```

## Running

```
./writer
./reader
```
