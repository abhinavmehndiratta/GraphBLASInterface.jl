"""
    GrB_UnaryOp_new(op, fn, ztype, xtype)

Initialize a new GraphBLAS unary operator with a specified user-defined function and its types.
"""
function GrB_UnaryOp_new(
    op::Abstract_GrB_UnaryOp,
    fn::Function,
    ztype::Abstract_GrB_Type,
    xtype::Abstract_GrB_Type)
end

"""
    GrB_BinaryOp_new(op, fn, ztype, xtype, ytype)

Initialize a new GraphBLAS binary operator with a specified user-defined function and its types.
"""
function GrB_BinaryOp_new(
    op::Abstract_GrB_BinaryOp,
    fn::Function,
    ztype::Abstract_GrB_Type,
    xtype::Abstract_GrB_Type,
    ytype::Abstract_GrB_Type)
end

"""
    GrB_Monoid_new(monoid, binary_op, identity)

Create a new monoid with specified binary operator and identity value.
"""
function GrB_Monoid_new(
        monoid::Abstract_GrB_Monoid,
        binary_op::Abstract_GrB_BinaryOp,
        identity)
end

"""
    GrB_Semiring_new(semiring, monoid, binary_op)

Create a new semiring with specified monoid and binary operator.
"""
function GrB_Semiring_new(
    semiring::Abstract_GrB_Semiring,
    monoid::Abstract_GrB_Monoid,
    binary_op::Abstract_GrB_BinaryOp)
end
