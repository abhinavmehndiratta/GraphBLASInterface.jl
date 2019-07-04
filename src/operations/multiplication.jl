"""
    GrB_mxm(C, Mask, accum, semiring, A, B, desc)

Multiplies a matrix with another matrix on a semiring. The result is a matrix.

# Examples
```jldoctest
julia> using GraphBLASInterface, SuiteSparseGraphBLAS

julia> GrB_init(GrB_NONBLOCKING)
GrB_SUCCESS::GrB_Info = 0

julia> A = GrB_Matrix{Int64}()
GrB_Matrix{Int64}

julia> GrB_Matrix_new(A, GrB_INT64, 2, 2)
GrB_SUCCESS::GrB_Info = 0

julia> I1 = [0, 1]; J1 = [0, 1]; X1 = [10, 20]; n1 = 2;

julia> GrB_Matrix_build(A, I1, J1, X1, n1, GrB_FIRST_INT64)
GrB_SUCCESS::GrB_Info = 0

julia> B = GrB_Matrix{Int64}()
GrB_Matrix{Int64}

julia> GrB_Matrix_new(B, GrB_INT64, 2, 2)
GrB_SUCCESS::GrB_Info = 0

julia> I2 = [0, 1]; J2 = [0, 1]; X2 = [5, 15]; n2 = 2;

julia> GrB_Matrix_build(B, I2, J2, X2, n2, GrB_FIRST_INT64)
GrB_SUCCESS::GrB_Info = 0

julia> C = GrB_Matrix{Int64}()
GrB_Matrix{Int64}

julia> GrB_Matrix_new(C, GrB_INT64, 2, 2)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_mxm(C, GrB_NULL, GrB_NULL, GxB_PLUS_TIMES_INT64, A, B, GrB_NULL)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_Matrix_extractTuples(C)
([0, 1], [0, 1], [50, 300])
```
"""
GrB_mxm(                                    # C<Mask> = accum (C, A*B)
    C::Abstract_GrB_Matrix,                 # input/output matrix for results
    Mask::matrix_mask_type,                 # optional mask for C, unused if NULL
    accum::accum_type,                      # optional accum for Z=accum(C,T)
    semiring::Abstract_GrB_Semiring,        # defines '+' and '*' for A*B
    A::Abstract_GrB_Matrix,                 # first input:  matrix A
    B::Abstract_GrB_Matrix,                 # second input: matrix B
    desc::desc_type                         # descriptor for C, Mask, A, and B
) = _NI("GrB_mxm")

"""
    GrB_vxm(w, mask, accum, semiring, u, A, desc)

Multiplies a (row)vector with a matrix on an semiring. The result is a vector.

# Examples
```jldoctest
julia> using GraphBLASInterface, SuiteSparseGraphBLAS

julia> GrB_init(GrB_NONBLOCKING)
GrB_SUCCESS::GrB_Info = 0

julia> A = GrB_Matrix{Int64}()
GrB_Matrix{Int64}

julia> GrB_Matrix_new(A, GrB_INT64, 2, 2)
GrB_SUCCESS::GrB_Info = 0

julia> I1 = [0, 1]; J1 = [0, 1]; X1 = [10, 20]; n1 = 2;

julia> GrB_Matrix_build(A, I1, J1, X1, n1, GrB_FIRST_INT64)
GrB_SUCCESS::GrB_Info = 0

julia> u = GrB_Vector{Int64}()
GrB_Vector{Int64}

julia> GrB_Vector_new(u, GrB_INT64, 2)
GrB_SUCCESS::GrB_Info = 0

julia> I2 = [0, 1]; X2 = [5, 6]; n2 = 2;

julia> GrB_Vector_build(u, I2, X2, n2, GrB_FIRST_INT64)
GrB_SUCCESS::GrB_Info = 0

julia> w = GrB_Vector{Int64}()
GrB_Vector{Int64}

julia> GrB_Vector_new(w, GrB_INT64, 2)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_vxm(w, GrB_NULL, GrB_NULL, GxB_PLUS_TIMES_INT64, u, A, GrB_NULL)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_Vector_extractTuples(w)
([0, 1], [50, 120])
```
"""
GrB_vxm(                                    # w'<Mask> = accum (w, u'*A)
    w::Abstract_GrB_Vector,                 # input/output vector for results
    mask::vector_mask_type,                 # optional mask for w, unused if NULL
    accum::accum_type,                      # optional accum for z=accum(w,t)
    semiring::Abstract_GrB_Semiring,        # defines '+' and '*' for u'*A
    u::Abstract_GrB_Vector,                 # first input:  vector u
    A::Abstract_GrB_Matrix,                 # second input: matrix A
    desc::desc_type                         # descriptor for w, mask, and A
) = _NI("GrB_vxm")

"""
    GrB_mxv(w, mask, accum, semiring, A, u, desc)

Multiplies a matrix by a vector on a semiring. The result is a vector.

# Examples
```jldoctest
julia> using GraphBLASInterface, SuiteSparseGraphBLAS

julia> GrB_init(GrB_NONBLOCKING)
GrB_SUCCESS::GrB_Info = 0

julia> A = GrB_Matrix{Int64}()
GrB_Matrix{Int64}

julia> GrB_Matrix_new(A, GrB_INT64, 2, 2)
GrB_SUCCESS::GrB_Info = 0

julia> I1 = [0, 0, 1]; J1 = [0, 1, 1]; X1 = [10, 20, 30]; n1 = 3;

julia> GrB_Matrix_build(A, I1, J1, X1, n1, GrB_FIRST_INT64)
GrB_SUCCESS::GrB_Info = 0

julia> u = GrB_Vector{Int64}()
GrB_Vector{Int64}

julia> GrB_Vector_new(u, GrB_INT64, 2)
GrB_SUCCESS::GrB_Info = 0

julia> I2 = [0, 1]; X2 = [5, 6]; n2 = 2;

julia> GrB_Vector_build(u, I2, X2, n2, GrB_FIRST_INT64)
GrB_SUCCESS::GrB_Info = 0

julia> w = GrB_Vector{Int64}()
GrB_Vector{Int64}

julia> GrB_Vector_new(w, GrB_INT64, 2)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_mxv(w, GrB_NULL, GrB_NULL, GxB_PLUS_TIMES_INT64, A, u, GrB_NULL)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_Vector_extractTuples(w)
([0, 1], [170, 180])
```
"""
GrB_mxv(                                    # w<Mask> = accum (w, A*u)
    w::Abstract_GrB_Vector,                 # input/output vector for results
    mask::vector_mask_type,                 # optional mask for w, unused if NULL
    accum::accum_type,                      # optional accum for z=accum(w,t)
    semiring::Abstract_GrB_Semiring,        # defines '+' and '*' for A*B
    A::Abstract_GrB_Matrix,                 # first input:  matrix A
    u::Abstract_GrB_Vector,                 # second input: vector u
    desc::desc_type                         # descriptor for w, mask, and A
) = _NI("GrB_mxv")
