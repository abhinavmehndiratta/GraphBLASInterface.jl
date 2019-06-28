"""
    GrB_eWiseMult(C, mask, accum, op, A, B, desc)

Generic method for element-wise matrix and vector operations: using set intersection.

`GrB_eWiseMult` computes `C<Mask> = accum (C, A .* B)`, where pairs of elements in two matrices (or vectors) are
pairwise "multiplied" with C(i, j) = mult (A(i, j), B(i, j)). The "multiplication" operator can be any binary operator.
The pattern of the result T = A .* B is the set intersection (not union) of A and B. Entries outside of the intersection
are not computed. This is primary difference with `GrB_eWiseAdd`. The input matrices A and/or B may be transposed first,
via the descriptor. For a semiring, the mult operator is the semiring's multiply operator; this differs from the
eWiseAdd methods which use the semiring's add operator instead.
"""
GrB_eWiseMult(C, mask, accum, op::Abstract_GrB_BinaryOp, A::Abstract_GrB_Vector, B, desc) = GrB_eWiseMult_Vector_BinaryOp(C, mask, accum, op, A, B, desc)
GrB_eWiseMult(C, mask, accum, op::Abstract_GrB_Monoid, A::Abstract_GrB_Vector, B, desc) = GrB_eWiseMult_Vector_Monoid(C, mask, accum, op, A, B, desc)
GrB_eWiseMult(C, mask, accum, op::Abstract_GrB_Semiring, A::Abstract_GrB_Vector, B, desc) = GrB_eWiseMult_Vector_Semiring(C, mask, accum, op, A, B, desc)
GrB_eWiseMult(C, mask, accum, op::Abstract_GrB_BinaryOp, A::Abstract_GrB_Matrix, B, desc) = GrB_eWiseMult_Matrix_BinaryOp(C, mask, accum, op, A, B, desc)
GrB_eWiseMult(C, mask, accum, op::Abstract_GrB_Monoid, A::Abstract_GrB_Matrix, B, desc) = GrB_eWiseMult_Matrix_Monoid(C, mask, accum, op, A, B, desc)
GrB_eWiseMult(C, mask, accum, op::Abstract_GrB_Semiring, A::Abstract_GrB_Matrix, B, desc) = GrB_eWiseMult_Matrix_Semiring(C, mask, accum, op, A, B, desc)

"""
    GrB_eWiseMult_Vector_Semiring(w, mask, accum, semiring, u, v, desc)

Compute element-wise vector multiplication using semiring. Semiring's multiply operator is used.
`w<mask> = accum (w, u .* v)`
"""
function GrB_eWiseMult_Vector_Semiring(          # w<Mask> = accum (w, u.*v)
        w::Abstract_GrB_Vector,                  # input/output vector for results
        mask::vector_mask_type,                  # optional mask for w, unused if NULL
        accum::accum_type,                       # optional accum for z=accum(w,t)
        semiring::Abstract_GrB_Semiring,         # defines '.*' for t=u.*v
        u::Abstract_GrB_Vector,                  # first input:  vector u
        v::Abstract_GrB_Vector,                  # second input: vector v
        desc::desc_type                          # descriptor for w and mask
)
end

"""
    GrB_eWiseMult_Vector_Monoid(w, mask, accum, monoid, u, v, desc)

Compute element-wise vector multiplication using monoid.
`w<mask> = accum (w, u .* v)`
"""
function GrB_eWiseMult_Vector_Monoid(           # w<Mask> = accum (w, u.*v)
        w::Abstract_GrB_Vector,                 # input/output vector for results
        mask::vector_mask_type,                 # optional mask for w, unused if NULL
        accum::accum_type,                      # optional accum for z=accum(w,t)
        monoid::Abstract_GrB_Monoid,            # defines '.*' for t=u.*v
        u::Abstract_GrB_Vector,                 # first input:  vector u
        v::Abstract_GrB_Vector,                 # second input: vector v
        desc::desc_type                         # descriptor for w and mask
)
end

"""
    GrB_eWiseMult_Vector_BinaryOp(w, mask, accum, mult, u, v, desc)

Compute element-wise vector multiplication using binary operator.
`w<mask> = accum (w, u .* v)`
"""
function GrB_eWiseMult_Vector_BinaryOp(         # w<Mask> = accum (w, u.*v)
        w::Abstract_GrB_Vector,                 # input/output vector for results
        mask::vector_mask_type,                 # optional mask for w, unused if NULL
        accum::accum_type,                      # optional accum for z=accum(w,t)
        mult::Abstract_GrB_BinaryOp,            # defines '.*' for t=u.*v
        u::Abstract_GrB_Vector,                 # first input:  vector u
        v::Abstract_GrB_Vector,                 # second input: vector v
        desc::desc_type                         # descriptor for w and mask
)
end

"""
    GrB_eWiseMult_Matrix_Semiring(C, Mask, accum, semiring, A, B, desc)

Compute element-wise matrix multiplication using semiring. Semiring's multiply operator is used.
`C<Mask> = accum (C, A .* B)`
"""
function GrB_eWiseMult_Matrix_Semiring(         # C<Mask> = accum (C, A.*B)
    C::Abstract_GrB_Matrix,                     # input/output matrix for results
    Mask::matrix_mask_type,                     # optional mask for C, unused if NULL
    accum::accum_type,                          # optional accum for Z=accum(C,T)
    semiring::Abstract_GrB_Semiring,            # defines '.*' for T=A.*B
    A::Abstract_GrB_Matrix,                     # first input:  matrix A
    B::Abstract_GrB_Matrix,                     # second input: matrix B
    desc::desc_type                             # descriptor for C, Mask, A, and B
)
end

"""
    GrB_eWiseMult_Matrix_Monoid(C, Mask, accum, monoid, A, B, desc)

Compute element-wise matrix multiplication using monoid.
`C<Mask> = accum (C, A .* B)`
"""
function GrB_eWiseMult_Matrix_Monoid(           # C<Mask> = accum (C, A.*B)
    C::Abstract_GrB_Matrix,                     # input/output matrix for results
    Mask::matrix_mask_type,                     # optional mask for C, unused if NULL
    accum::accum_type,                          # optional accum for Z=accum(C,T)
    monoid::Abstract_GrB_Monoid,                # defines '.*' for T=A.*B
    A::Abstract_GrB_Matrix,                     # first input:  matrix A
    B::Abstract_GrB_Matrix,                     # second input: matrix B
    desc::desc_type                             # descriptor for C, Mask, A, and B
)
end

"""
    GrB_eWiseMult_Matrix_BinaryOp(C, Mask, accum, mult, A, B, desc)

Compute element-wise matrix multiplication using binary operator.
`C<Mask> = accum (C, A .* B)`
"""
function GrB_eWiseMult_Matrix_BinaryOp(         # C<Mask> = accum (C, A.*B)
    C::Abstract_GrB_Matrix,                     # input/output matrix for results
    Mask::matrix_mask_type,                     # optional mask for C, unused if NULL
    accum::accum_type,                          # optional accum for Z=accum(C,T)
    mult::Abstract_GrB_BinaryOp,                # defines '.*' for T=A.*B
    A::Abstract_GrB_Matrix,                     # first input:  matrix A
    B::Abstract_GrB_Matrix,                     # second input: matrix B
    desc::desc_type                             # descriptor for C, Mask, A, and B
)
end
