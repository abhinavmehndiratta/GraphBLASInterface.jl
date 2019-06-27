"""
    GrB_transpose(C, Mask, accum, A, desc)

Compute a new matrix that is the transpose of the source matrix.
"""
function GrB_transpose(                                 # C<Mask> = accum (C, A')
        C::Abstract_GrB_Matrix{Z},                      # input/output matrix for results
        Mask::matrix_mask_type,                         # optional mask for C, unused if NULL
        accum::Abstract_GrB_BinaryOp{Z, Z, X},          # optional accum for Z=accum(C,T)
        A::Abstract_GrB_Matrix{X},                      # first input:  matrix A
        desc::desc_type                                 # descriptor for C, Mask, and A
) where {X, Z}
end

function GrB_transpose(
        C::Abstract_GrB_Matrix{Z},
        Mask::matrix_mask_type,
        accum::Abstract_GrB_NULL,
        A::Abstract_GrB_Matrix{Z},
        desc::desc_type
) where Z
end
