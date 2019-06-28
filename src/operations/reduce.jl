"""
    GrB_reduce(arg1, arg2, arg3, arg4, ...)

Generic method for matrix/vector reduction to a vector or scalar.
"""
GrB_reduce(w, mask, accum, monoid::Abstract_GrB_Monoid, A, desc) = GrB_Matrix_reduce_Monoid(w, mask, accum, monoid, A, desc)
GrB_reduce(w, mask, accum, op::Abstract_GrB_BinaryOp, A, desc) = GrB_Matrix_reduce_BinaryOp(w, mask, accum, op, A, desc)
GrB_reduce(monoid, u::Abstract_GrB_Vector, desc) = GrB_Vector_reduce(monoid, u, desc)
GrB_reduce(monoid, A::Abstract_GrB_Matrix, desc) = GrB_Matrix_reduce(monoid, A, desc)

"""
    GrB_Matrix_reduce_Monoid(w, mask, accum, monoid, A, desc)

Reduce the entries in a matrix to a vector. By default these methods compute a column vector w
such that w(i) = sum(A(i,:)), where "sum" is a commutative and associative monoid with an identity value.
A can be transposed, which reduces down the columns instead of the rows.
"""
function GrB_Matrix_reduce_Monoid(          # w<mask> = accum (w,reduce(A))
    w::Abstract_GrB_Vector,                 # input/output vector for results
    mask::vector_mask_type,                 # optional mask for w, unused if NULL
    accum::accum_type,                      # optional accum for z=accum(w,t)
    monoid::Abstract_GrB_Monoid,            # reduce operator for t=reduce(A)
    A::Abstract_GrB_Matrix,                 # first input:  matrix A
    desc::desc_type                         # descriptor for w, mask, and A
)
end

"""
    GrB_Matrix_reduce_BinaryOp(w, mask, accum, op, A, desc)

Reduce the entries in a matrix to a vector. By default these methods compute a column vector w such that
w(i) = sum(A(i,:)), where "sum" is a commutative and associative binary operator. A can be transposed,
which reduces down the columns instead of the rows.
"""
function GrB_Matrix_reduce_BinaryOp(        # w<mask> = accum (w,reduce(A))
    w::Abstract_GrB_Vector,                 # input/output vector for results
    mask::vector_mask_type,                 # optional mask for w, unused if NULL
    accum::accum_type,                      # optional accum for z=accum(w,t)
    op::Abstract_GrB_BinaryOp,              # reduce operator for t=reduce(A)
    A::Abstract_GrB_Matrix,                 # first input:  matrix A
    desc::desc_type                         # descriptor for w, mask, and A
)
end

"""
    GrB_Vector_reduce(monoid, u, desc)

Reduce entries in a vector to a scalar. All entries in the vector are "summed"
using the reduce monoid, which must be associative (otherwise the results are undefined).
If the vector has no entries, the result is the identity value of the monoid.
"""
function GrB_Vector_reduce(                 # reduce_to_scalar(u)
    monoid::Abstract_GrB_Monoid,            # monoid to do the reduction
    u::Abstract_GrB_Vector,                 # vector to reduce
    desc::desc_type                         # descriptor
)
end

"""
    GrB_Matrix_reduce(monoid, A, desc)

Reduce entries in a matrix to a scalar. All entries in the matrix are "summed"
using the reduce monoid, which must be associative (otherwise the results are undefined).
If the matrix has no entries, the result is the identity value of the monoid.
"""
function GrB_Matrix_reduce(                 # reduce_to_scalar(A)
    monoid::Abstract_GrB_Monoid,            # monoid to do the reduction
    A::Abstract_GrB_Matrix,                 # matrix to reduce
    desc::desc_type                         # descriptor
)
end
