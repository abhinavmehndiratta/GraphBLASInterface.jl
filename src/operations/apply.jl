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
function GrB_Vector_apply(                      # w<mask> = accum (w, op(u))
    w::Abstract_GrB_Vector{Z},                  # input/output vector for results
    mask::vector_mask_type,                     # optional mask for w, unused if NULL
    accum::Abstract_GrB_BinaryOp{Z, Z, Y},      # optional accum for z=accum(w,t)
    op::Abstract_GrB_UnaryOp{Y, X},             # operator to apply to the entries
    u::Abstract_GrB_Vector{X},                  # first input:  vector u
    desc::desc_type                             # descriptor for w and mask
) where {X, Y, Z}
end

function GrB_Vector_apply(
    w::Abstract_GrB_Vector{Z},
    mask::vector_mask_type,
    accum::Abstract_GrB_NULL,
    op::Abstract_GrB_UnaryOp{Z, X},
    u::Abstract_GrB_Vector{X},
    desc::desc_type
) where {X, Z}
end

"""
    GrB_Matrix_apply(C, Mask, accum, op, A, desc)

Compute the transformation of the values of the elements of a matrix using a unary function.
"""
function GrB_Matrix_apply(                      # C<Mask> = accum (C, op(A)) or op(A')
    C::Abstract_GrB_Matrix{Z},                  # input/output matrix for results
    Mask::matrix_mask_type,                     # optional mask for C, unused if NULL
    accum::Abstract_GrB_BinaryOp{Z, Z, X},      # optional accum for Z=accum(C,T)
    op::Abstract_GrB_UnaryOp{Y, X},             # operator to apply to the entries
    A::Abstract_GrB_Matrix{X},                  # first input:  matrix A
    desc::desc_type                             # descriptor for C, mask, and A
) where {X, Y, Z}
end

function GrB_Matrix_apply(
    C::Abstract_GrB_Matrix{Z},
    Mask::matrix_mask_type,
    accum::Abstract_GrB_NULL,
    op::Abstract_GrB_UnaryOp{Z, X},
    A::Abstract_GrB_Matrix{X},
    desc::desc_type
) where {X, Z}
end
