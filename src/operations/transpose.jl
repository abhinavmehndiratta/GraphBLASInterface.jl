"""
    GrB_transpose(C, Mask, accum, A, desc)

Compute a new matrix that is the transpose of the source matrix.
"""
function GrB_transpose(                         # C<Mask> = accum (C, A')
        C::Abstract_GrB_Matrix,                 # input/output matrix for results
        Mask::matrix_mask_type,                 # optional mask for C, unused if NULL
        accum::accum_type,                      # optional accum for Z=accum(C,T)
        A::Abstract_GrB_Matrix,                 # first input:  matrix A
        desc::desc_type                         # descriptor for C, Mask, and A
)
end
