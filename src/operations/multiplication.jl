"""
    GrB_mxm(C, Mask, accum, semiring, A, B, desc)

Multiplies a matrix with another matrix on a semiring. The result is a matrix.
"""
function GrB_mxm(                                   # C<Mask> = accum (C, A*B)
    C::Abstract_GrB_Matrix{Z},                      # input/output matrix for results
    Mask::matrix_mask_type,                         # optional mask for C, unused if NULL
    accum::Abstract_GrB_BinaryOp{Z, Z, W},          # optional accum for Z=accum(C,T)
    semiring::Abstract_GrB_Semiring{W, X, Y},       # defines '+' and '*' for A*B
    A::Abstract_GrB_Matrix{X},                      # first input:  matrix A
    B::Abstract_GrB_Matrix{Y},                      # second input: matrix B
    desc::desc_type                                 # descriptor for C, Mask, A, and B
) where {W, X, Y, Z}
end

function GrB_mxm(                           
    C::Abstract_GrB_Matrix{Z},                 
    Mask::matrix_mask_type,
    accum::Abstract_GrB_NULL,                               
    semiring::Abstract_GrB_Semiring{Z, X, Y},        
    A::Abstract_GrB_Matrix{X},                 
    B::Abstract_GrB_Matrix{Y},                 
    desc::desc_type                                 
) where {X, Y, Z}
end

"""
    GrB_vxm(w, mask, accum, semiring, u, A, desc)

Multiplies a (row)vector with a matrix on an semiring. The result is a vector.
"""
function GrB_vxm(                                   # w'<Mask> = accum (w, u'*A)
    w::Abstract_GrB_Vector{Z},                      # input/output vector for results
    mask::vector_mask_type,                         # optional mask for w, unused if NULL
    accum::Abstract_GrB_BinaryOp{Z, Z, W},          # optional accum for z=accum(w,t)
    semiring::Abstract_GrB_Semiring{W, X, Y},       # defines '+' and '*' for u'*A
    u::Abstract_GrB_Vector{X},                      # first input:  vector u
    A::Abstract_GrB_Matrix{Y},                      # second input: matrix A
    desc::desc_type                                 # descriptor for w, mask, and A
) where {W, X, Y, Z}
end

function GrB_vxm(                           
    w::Abstract_GrB_Vector{Z},                 
    mask::vector_mask_type,                               
    accum::Abstract_GrB_NULL,                               
    semiring::Abstract_GrB_Semiring{Z, X, Y},        
    u::Abstract_GrB_Vector{X},                 
    A::Abstract_GrB_Matrix{Y},                 
    desc::desc_type                                 
) where {X, Y, Z}
end

"""
    GrB_mxv(w, mask, accum, semiring, A, u, desc)

Multiplies a matrix by a vector on a semiring. The result is a vector.
"""
function GrB_mxv(                                   # w<Mask> = accum (w, A*u)
    w::Abstract_GrB_Vector{Z},                      # input/output vector for results
    mask::vector_mask_type,                         # optional mask for w, unused if NULL
    accum::Abstract_GrB_BinaryOp{Z, Z, W},          # optional accum for z=accum(w,t)
    semiring::Abstract_GrB_Semiring{W, X, Y},       # defines '+' and '*' for A*B
    A::Abstract_GrB_Matrix{X},                      # first input:  matrix A
    u::Abstract_GrB_Vector{Y},                      # second input: vector u
    desc::desc_type                                 # descriptor for w, mask, and A
) where {W, X, Y, Z}
end

function GrB_mxv(                           
    w::Abstract_GrB_Vector{Z},                 
    mask::vector_mask_type,                                
    accum::Abstract_GrB_NULL,                               
    semiring::Abstract_GrB_Semiring{Z, X, Y},       
    A::Abstract_GrB_Matrix{X},                 
    u::Abstract_GrB_Vector{Y},               
    desc::desc_type                                 
) where {X, Y, Z}
end
