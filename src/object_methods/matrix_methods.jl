"""
    GrB_Matrix_new(A, type, nrows, ncols)

Create a new matrix with specified domain and dimensions.
"""
function GrB_Matrix_new(
        A::Abstract_GrB_Matrix{T},
        type::Abstract_GrB_Type{T},
        nrows::GrB_Index,
        ncols::GrB_Index) where T
end

"""
    GrB_Matrix_build(C, I, J, X, nvals, dup)

Store elements from tuples into a matrix.
"""
function GrB_Matrix_build(
        C::Abstract_GrB_Matrix{T},
        I::Vector{U},
        J::Vector{U},
        X::Vector{T},
        nvals::U,
        dup::Abstract_GrB_BinaryOp{T, T, T}) where {T, U <: GrB_Index}
end

"""
    GrB_Matrix_nrows(A)

Return the number of rows in a matrix if successful.
Else return `GrB_Info` error code.
"""
function GrB_Matrix_nrows(A::Abstract_GrB_Matrix) end

"""
    GrB_Matrix_ncols(A)

Return the number of columns in a matrix if successful.
Else return `GrB_Info` error code.
"""
function GrB_Matrix_ncols(A::Abstract_GrB_Matrix) end

"""
    GrB_Matrix_nvals(A)

Return the number of stored elements in a matrix if successful.
Else return `GrB_Info` error code..
"""
function GrB_Matrix_nvals(A::Abstract_GrB_Matrix) end

"""
    GrB_Matrix_dup(C, A)

Create a new matrix with the same domain, dimensions, and contents as another matrix.
"""
function GrB_Matrix_dup(C::Abstract_GrB_Matrix{T}, A::Abstract_GrB_Matrix{T}) where T end

"""
    GrB_Matrix_clear(A)

Remove all elements from a matrix.
"""
function GrB_Matrix_clear(A::Abstract_GrB_Matrix) end

"""
    GrB_Matrix_setElement(C, X, I, J)

Set one element of a matrix to a given value, C[I][J] = X.
"""
function GrB_Matrix_setElement(
        C::Abstract_GrB_Matrix{T},
        X::T,
        I::GrB_Index,
        J::GrB_Index) where T
end

"""
    GrB_Matrix_extractElement(A, row_index, col_index)

Return element of a matrix at a given index (A[row_index][col_index]) if successful.
Else return `GrB_Info` error code.
"""
function GrB_Matrix_extractElement(
        A::Abstract_GrB_Matrix,
        row_index::GrB_Index,
        col_index::GrB_Index)
end

"""
    GrB_Matrix_extractTuples(A)

Return tuples stored in a matrix if successful.
Else return `GrB_Info` error code.
"""
function GrB_Matrix_extractTuples(A::Abstract_GrB_Matrix) end
