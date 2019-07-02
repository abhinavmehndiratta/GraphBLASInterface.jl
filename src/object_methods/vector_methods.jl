"""
    GrB_Vector_new(v, type, n)

Initialize a vector with specified domain and size.
"""
function GrB_Vector_new(
        v::Abstract_GrB_Vector,
        type::Abstract_GrB_Type,
        n::GrB_Index)
end

"""
    GrB_Vector_dup(w, u)

Initialize a vector with the same domain, size, and contents as another vector.
"""
function GrB_Vector_dup(w::Abstract_GrB_Vector, u::Abstract_GrB_Vector) end

"""
    GrB_Vector_clear(v)

Remove all the elements (tuples) from a vector.
"""
function GrB_Vector_clear(v::Abstract_GrB_Vector) end

"""
    GrB_Vector_size(v)

Return the size of a vector if successful.
Else return `GrB_Info` error code.
"""
function GrB_Vector_size(v::Abstract_GrB_Vector) end

"""
    GrB_Vector_nvals(v)

Return the number of stored elements in a vector if successful.
Else return `GrB_Info` error code.
"""
function GrB_Vector_nvals(v::Abstract_GrB_Vector) end

"""
    GrB_Vector_build(w, I, X, nvals, dup)

Store elements from tuples into a vector.
"""
function GrB_Vector_build(
        w::Abstract_GrB_Vector,
        I::Vector{U},
        X::Vector,
        nvals::U,
        dup::Abstract_GrB_BinaryOp) where {U <: GrB_Index}
end

"""
    GrB_Vector_setElement(w, x, i)

Set one element of a vector to a given value, w[i] = x.
"""
function GrB_Vector_setElement(
        w::Abstract_GrB_Vector,
        x,
        i::GrB_Index)
end

"""
    GrB_Vector_extractElement(v, i)

Return element of a vector at a given index (v[i]) if successful.
Else return `GrB_Info` error code.
"""
function GrB_Vector_extractElement(v::Abstract_GrB_Vector, i::GrB_Index) end

"""
    GrB_Vector_extractTuples(v)

Return tuples stored in a vector if successful.
Else return `GrB_Info` error code.
"""
function GrB_Vector_extractTuples(v::Abstract_GrB_Vector) end
