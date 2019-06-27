export Abstract_GrB_Type, Abstract_GrB_UnaryOp, Abstract_GrB_BinaryOp, Abstract_GrB_Monoid, Abstract_GrB_Semiring,
       Abstract_GrB_Vector, Abstract_GrB_Matrix, Abstract_GrB_Descriptor, Abstract_GrB_NULL, Abstract_GrB_ALL

abstract type Abstract_GrB_Type{T} end

abstract type Abstract_GrB_UnaryOp{Z, X} end

abstract type Abstract_GrB_BinaryOp{Z, X, Y} end

abstract type Abstract_GrB_Monoid{T, B <: Abstract_GrB_BinaryOp{T, T, T}} end

abstract type Abstract_GrB_Semiring{Z, X, Y, M <: Abstract_GrB_Monoid{Z}, B <: Abstract_GrB_BinaryOp{Z, X, Y}} end

abstract type Abstract_GrB_Vector{T} end

abstract type Abstract_GrB_Matrix{T} end

abstract type Abstract_GrB_Descriptor end

abstract type Abstract_GrB_NULL end

abstract type Abstract_GrB_ALL end
