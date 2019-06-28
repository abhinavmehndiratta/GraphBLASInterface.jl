"""
    GrB_mxm(C, Mask, accum, semiring, A, B, desc)

Multiplies a matrix with another matrix on a semiring. The result is a matrix.
"""
function GrB_mxm(                           # C<Mask> = accum (C, A*B)
    C::Abstract_GrB_Matrix,                 # input/output matrix for results
    Mask::matrix_mask_type,                 # optional mask for C, unused if NULL
    accum::accum_type,                      # optional accum for Z=accum(C,T)
    semiring::Abstract_GrB_Semiring,        # defines '+' and '*' for A*B
    A::Abstract_GrB_Matrix,                 # first input:  matrix A
    B::Abstract_GrB_Matrix,                 # second input: matrix B
    desc::desc_type                         # descriptor for C, Mask, A, and B
)
end

"""
    GrB_vxm(w, mask, accum, semiring, u, A, desc)

Multiplies a (row)vector with a matrix on an semiring. The result is a vector.
"""
function GrB_vxm(                           # w'<Mask> = accum (w, u'*A)
    w::Abstract_GrB_Vector,                 # input/output vector for results
    mask::vector_mask_type,                 # optional mask for w, unused if NULL
    accum::accum_type,                      # optional accum for z=accum(w,t)
    semiring::Abstract_GrB_Semiring,        # defines '+' and '*' for u'*A
    u::Abstract_GrB_Vector,                 # first input:  vector u
    A::Abstract_GrB_Matrix,                 # second input: matrix A
    desc::desc_type                         # descriptor for w, mask, and A
)
end

"""
    GrB_mxv(w, mask, accum, semiring, A, u, desc)

Multiplies a matrix by a vector on a semiring. The result is a vector.
"""
function GrB_mxv(                           # w<Mask> = accum (w, A*u)
    w::Abstract_GrB_Vector,                 # input/output vector for results
    mask::vector_mask_type,                 # optional mask for w, unused if NULL
    accum::accum_type,                      # optional accum for z=accum(w,t)
    semiring::Abstract_GrB_Semiring,        # defines '+' and '*' for A*B
    A::Abstract_GrB_Matrix,                 # first input:  matrix A
    u::Abstract_GrB_Vector,                 # second input: vector u
    desc::desc_type                         # descriptor for w, mask, and A
)
end
