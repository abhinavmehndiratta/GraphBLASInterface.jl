"""
    GrB_free(object)

Generic method to free a GraphBLAS object.
"""
GrB_free(object::Abstract_GrB_UnaryOp) = GrB_UnaryOp_free(object)
GrB_free(object::Abstract_GrB_BinaryOp) = GrB_BinaryOp_free(object)
GrB_free(object::Abstract_GrB_Monoid) = GrB_Monoid_free(object)
GrB_free(object::Abstract_GrB_Semiring) = GrB_Semiring_free(object)
GrB_free(object::Abstract_GrB_Vector) = GrB_Vector_free(object)
GrB_free(object::Abstract_GrB_Matrix) = GrB_Matrix_free(object)
GrB_free(object::Abstract_GrB_Descriptor) = GrB_Descriptor_free(object)

"""
    GrB_UnaryOp_free(unaryop)

Free unary operator.
"""
function GrB_UnaryOp_free(unaryop::Abstract_GrB_UnaryOp) end

"""
    GrB_BinaryOp_free(binaryop)

Free binary operator.
"""
function GrB_BinaryOp_free(binaryop::Abstract_GrB_BinaryOp) end

"""
    GrB_Monoid_free(monoid)

Free monoid.
"""
function GrB_Monoid_free(monoid::Abstract_GrB_Monoid) end

"""
    GrB_Semiring_free(semiring)

Free semiring.
"""
function GrB_Semiring_free(semiring::Abstract_GrB_Semiring) end

"""
    GrB_Vector_free(v)

Free vector.
"""
function GrB_Vector_free(v::Abstract_GrB_Vector) end

"""
    GrB_Matrix_free(A)

Free matrix.
"""
function GrB_Matrix_free(A::Abstract_GrB_Matrix) end

"""
    GrB_Descriptor_free(desc)

Free descriptor.
"""
function GrB_Descriptor_free(desc::Abstract_GrB_Descriptor) end
