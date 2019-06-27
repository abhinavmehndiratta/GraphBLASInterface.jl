"""
    GrB_extract(arg1, Mask, accum, arg4, ...)

Generic matrix/vector extraction.
"""
GrB_extract(w::Abstract_GrB_Vector, mask, accum, u::Abstract_GrB_Vector, I, ni, desc) = GrB_Vector_extract(w, mask, accum, u, I, ni, desc)
GrB_extract(C::Abstract_GrB_Matrix, Mask, accum, A::Abstract_GrB_Matrix, I, ni, J, nj, desc) = GrB_Matrix_extract(C, Mask, accum, A, I, ni, J, nj, desc)
GrB_extract(w::Abstract_GrB_Vector, mask, accum, A::Abstract_GrB_Matrix, I, ni, j, desc) = GrB_Col_extract(w, mask, accum, A, I, ni, j, desc)

"""
    GrB_Vector_extract(w, mask, accum, u, I, ni, desc)

Extract a sub-vector from a larger vector as specified by a set of indices.
The result is a vector whose size is equal to the number of indices.
"""
function GrB_Vector_extract(                        # w<mask> = accum (w, u(I))
        w::Abstract_GrB_Vector{Z},                  # input/output vector for results
        mask::vector_mask_type,                     # optional mask for w, unused if NULL
        accum::Abstract_GrB_BinaryOp{Z, Z, X},      # optional accum for z=accum(w,t)
        u::Abstract_GrB_Vector,                     # first input:  vector u
        I::indices_type,                            # row indices
        ni::GrB_Index,                              # number of row indices
        desc::desc_type                             # descriptor for w and mask
) where {X, Z}
end

function GrB_Vector_extract(
        w::Abstract_GrB_Vector{Z},
        mask::vector_mask_type,
        accum::Abstract_GrB_NULL,
        u::Abstract_GrB_Vector{Z},
        I::indices_type,
        ni::GrB_Index,
        desc::desc_type
) where Z
end

"""
    GrB_Matrix_extract(C, Mask, accum, A, I, ni, J, nj, desc)

Extract a sub-matrix from a larger matrix as specified by a set of row indices and a set of column indices.
The result is a matrix whose size is equal to size of the sets of indices.
"""
function GrB_Matrix_extract(                        # C<Mask> = accum (C, A(I,J))
        C::Abstract_GrB_Matrix{Z},                  # input/output matrix for results
        Mask::matrix_mask_type,                     # optional mask for C, unused if NULL
        accum::Abstract_GrB_BinaryOp{Z, Z, X},      # optional accum for Z=accum(C,T)
        A::Abstract_GrB_Matrix{X},                  # first input:  matrix A
        I::indices_type,                            # row indices
        ni::GrB_Index,                              # number of row indices
        J::indices_type,                            # column indices
        nj::GrB_Index,                              # number of column indices
        desc::desc_type                             # descriptor for C, Mask, and A
) where {X, Z}
end

function GrB_Matrix_extract(
        C::Abstract_GrB_Matrix{Z},
        Mask::matrix_mask_type,
        accum::Abstract_GrB_NULL,
        A::Abstract_GrB_Matrix{Z},
        I::indices_type,
        ni::GrB_Index,
        J::indices_type,
        nj::GrB_Index,
        desc::desc_type
) where Z
end

"""
    GrB_Col_extract(w, mask, accum, A, I, ni, j, desc)

Extract from one column of a matrix into a vector. With the transpose descriptor for the source matrix,
elements of an arbitrary row of the matrix can be extracted with this function as well.
"""
function GrB_Col_extract(                           # w<mask> = accum (w, A(I,j))
        w::Abstract_GrB_Vector{Z},                  # input/output matrix for results
        mask::vector_mask_type,                     # optional mask for w, unused if NULL
        accum::Abstract_GrB_BinaryOp{Z, Z, X},      # optional accum for z=accum(w,t)
        A::Abstract_GrB_Matrix{X},                  # first input:  matrix A
        I::indices_type,                            # row indices
        ni::GrB_Index,                              # number of row indices
        j::GrB_Index,                               # column index
        desc::desc_type                             # descriptor for w, mask, and A
) where {X, Z}
end

function GrB_Col_extract(
        w::Abstract_GrB_Vector{Z},
        mask::vector_mask_type,
        accum::Abstract_GrB_NULL,
        A::Abstract_GrB_Matrix{Z},
        I::indices_type,
        ni::GrB_Index,
        j::GrB_Index,
        desc::desc_type
) where Z
end
