"""
    GrB_UnaryOp_new(op, fn, ztype, xtype)

Initialize a new GraphBLAS unary operator with a specified user-defined function and its types.
"""
function GrB_UnaryOp_new(
    op::Abstract_GrB_UnaryOp{Z, X},
    fn::Function,
    ztype::Abstract_GrB_Type{Z},
    xtype::Abstract_GrB_Type{X}) where {Z, X}
end

"""
    GrB_BinaryOp_new(op, fn, ztype, xtype, ytype)

Initialize a new GraphBLAS binary operator with a specified user-defined function and its types.
"""
function GrB_BinaryOp_new(
    op::Abstract_GrB_BinaryOp{Z, X, Y},
    fn::Function,
    ztype::Abstract_GrB_Type{Z},
    xtype::Abstract_GrB_Type{X},
    ytype::Abstract_GrB_Type{Y}) where {Z, X, Y}
end

"""
    GrB_Monoid_new(monoid, binary_op, identity)

Create a new monoid with specified binary operator and identity value.
"""
function GrB_Monoid_new(
        monoid::Abstract_GrB_Monoid{T, B},
        binary_op::B,
        identity::T) where {T, B}
end

"""
    GrB_Semiring_new(semiring, monoid, binary_op)

Create a new semiring with specified monoid and binary operator.
"""
function GrB_Semiring_new(
    semiring::Abstract_GrB_Semiring{Z, X, Y, M, B},
    monoid::M,
    binary_op::B) where {Z, X, Y, M, B}
end
