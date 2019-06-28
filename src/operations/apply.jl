"""
    GrB_apply(C, Mask, accum, op, A, desc)

Generic matrix/vector apply.
"""
GrB_apply(C::Abstract_GrB_Vector, Mask, accum, op, A, desc) = GrB_Vector_apply(C, Mask, accum, op, A, desc)
GrB_apply(C::Abstract_GrB_Matrix, Mask, accum, op, A, desc) = GrB_Matrix_apply(C, Mask, accum, op, A, desc)

"""
    GrB_Vector_apply(w, mask, accum, op, u, desc)

Compute the transformation of the values of the elements of a vector using a unary function.
"""
function GrB_Vector_apply(              # w<mask> = accum (w, op(u))
    w::Abstract_GrB_Vector,             # input/output vector for results
    mask::vector_mask_type,             # optional mask for w, unused if NULL
    accum::accum_type,                  # optional accum for z=accum(w,t)
    op::Abstract_GrB_UnaryOp,           # operator to apply to the entries
    u::Abstract_GrB_Vector,             # first input:  vector u
    desc::desc_type                     # descriptor for w and mask
)
end

"""
    GrB_Matrix_apply(C, Mask, accum, op, A, desc)

Compute the transformation of the values of the elements of a matrix using a unary function.
"""
function GrB_Matrix_apply(              # C<Mask> = accum (C, op(A)) or op(A')
    C::Abstract_GrB_Matrix,             # input/output matrix for results
    Mask::matrix_mask_type,             # optional mask for C, unused if NULL
    accum::accum_type,                  # optional accum for Z=accum(C,T)
    op::Abstract_GrB_UnaryOp,           # operator to apply to the entries
    A::Abstract_GrB_Matrix,             # first input:  matrix A
    desc::desc_type                     # descriptor for C, mask, and A
)
end
