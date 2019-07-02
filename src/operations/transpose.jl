"""
    GrB_transpose(C, Mask, accum, A, desc)

Compute a new matrix that is the transpose of the source matrix.

# Examples
```jldoctest
julia> using GraphBLASInterface, SuiteSparseGraphBLAS

julia> GrB_init(GrB_NONBLOCKING)
GrB_SUCCESS::GrB_Info = 0

julia> M = GrB_Matrix{Int64}()
GrB_Matrix{Int64}

julia> GrB_Matrix_new(M, GrB_INT64, 4, 4)
GrB_SUCCESS::GrB_Info = 0

julia> I = [0, 0]; J = [1, 2]; X = [10, 20]; n = 2;

julia> GrB_Matrix_build(M, I, J, X, n, GrB_FIRST_INT64)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_Matrix_extractTuples(M)
([0, 0], [1, 2], [10, 20])

julia> M_TRAN = GrB_Matrix{Int64}()
GrB_Matrix{Int64}

julia> GrB_Matrix_new(M_TRAN, GrB_INT64, 4, 4)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_transpose(M_TRAN, GrB_NULL, GrB_NULL, M, GrB_NULL)
GrB_SUCCESS::GrB_Info = 0

julia> GrB_Matrix_extractTuples(M_TRAN)
([1, 2], [0, 0], [10, 20])
```
"""
function GrB_transpose(                         # C<Mask> = accum (C, A')
        C::Abstract_GrB_Matrix,                 # input/output matrix for results
        Mask::matrix_mask_type,                 # optional mask for C, unused if NULL
        accum::accum_type,                      # optional accum for Z=accum(C,T)
        A::Abstract_GrB_Matrix,                 # first input:  matrix A
        desc::desc_type                         # descriptor for C, Mask, and A
)
end
