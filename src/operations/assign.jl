"""
    GrB_assign(arg1, Mask, accum, arg4, arg5, ...)

Generic method for submatrix/subvector assignment.
"""
GrB_assign(w::Abstract_GrB_Vector, mask, accum, u::Abstract_GrB_Vector, I, ni, desc ) = GrB_Vector_assign(w, mask, accum, u, I, ni, desc)
GrB_assign(w::Abstract_GrB_Vector, mask, accum, x, I, ni, desc) = GrB_Vector_assign(w, mask, accum, x, I, ni, desc )
GrB_assign(C::Abstract_GrB_Matrix, Mask, accum, A::Abstract_GrB_Matrix, I, ni, J, nj, desc) = GrB_Matrix_assign(C, Mask, accum, A, I, ni, J, nj, desc)
GrB_assign(C::Abstract_GrB_Matrix, Mask, accum, u::Abstract_GrB_Vector, I, ni, j, desc) = GrB_Col_assign(C, Mask, accum, u, I, ni, j, desc)
GrB_assign(C::Abstract_GrB_Matrix, Mask, accum, u::Abstract_GrB_Vector, i::GrB_Index, J, nj, desc) = GrB_Row_assign(C, Mask, accum, u, i, J, nj, desc)
GrB_assign(C::Abstract_GrB_Matrix, Mask, accum, x, I, ni, J, nj, desc) = GrB_Matrix_assign(C, Mask, accum, x, I, ni, J, nj, desc)

"""
    GrB_Vector_assign(w, mask, accum, u, I, ni, desc)

Assign values from one GraphBLAS vector to a subset of a vector as specified by a set of
indices. The size of the input vector is the same size as the index array provided.
"""
function GrB_Vector_assign(                         # w<mask>(I) = accum (w(I),u)
        w::Abstract_GrB_Vector,                     # input/output matrix for results
        mask::vector_mask_type,                     # optional mask for w, unused if NULL
        accum::accum_type,                          # optional accum for z=accum(w(I),t)
        u::Abstract_GrB_Vector,                     # first input:  vector u
        I::indices_type,                            # row indices
        ni::GrB_Index,                              # number of row indices
        desc::desc_type                             # descriptor for w and mask
)
end

"""
    GrB_Matrix_assign(C, Mask, accum, A, I, ni, J, nj, desc)

Assign values from one GraphBLAS matrix to a subset of a matrix as specified by a set of
indices. The dimensions of the input matrix are the same size as the row and column index arrays provided.
"""
function GrB_Matrix_assign(                         # C<Mask>(I,J) = accum (C(I,J),A)
        C::Abstract_GrB_Matrix,                     # input/output matrix for results
        Mask::matrix_mask_type,                     # optional mask for C, unused if NULL
        accum::accum_type,                          # optional accum for Z=accum(C(I,J),T)
        A::Abstract_GrB_Matrix,                     # first input:  matrix A
        I::indices_type,                            # row indices
        ni::GrB_Index,                              # number of row indices
        J::indices_type,                            # column indices
        nj::GrB_Index,                              # number of column indices
        desc::desc_type                             # descriptor for C, Mask, and A
)
end

"""
    GrB_Col_assign(C, Mask, accum, u, I, ni, j, desc)

Assign the contents of a vector to a subset of elements in one column of a matrix.
Note that since the output cannot be transposed, a different variant of assign is provided
to assign to a row of matrix.
"""
function GrB_Col_assign(                            # C<mask>(I,j) = accum (C(I,j),u)
        C::Abstract_GrB_Matrix,                     # input/output matrix for results
        mask::vector_mask_type,                     # optional mask for C(:,j), unused if NULL
        accum::accum_type,                          # optional accum for z=accum(C(I,j),t)
        u::Abstract_GrB_Vector,                     # input vector
        I::indices_type,                            # row indices
        ni::GrB_Index,                              # number of row indices
        j::GrB_Index,                               # column index
        desc::desc_type                             # descriptor for C(:,j) and mask
)
end

"""
    GrB_Row_assign(C, mask, accum, u, i, J, nj, desc)

Assign the contents of a vector to a subset of elements in one row of a matrix.
Note that since the output cannot be transposed, a different variant of assign is provided
to assign to a column of a matrix.
"""
function GrB_Row_assign(                            # C<mask'>(i,J) = accum (C(i,J),u')
        C::Abstract_GrB_Matrix,                     # input/output matrix for results
        mask::vector_mask_type,                     # optional mask for C(i,:), unused if NULL
        accum::accum_type,                          # optional accum for z=accum(C(i,J),t)
        u::Abstract_GrB_Vector,                     # input vector
        i::GrB_Index,                               # row index
        J::indices_type,                            # column indices
        nj::GrB_Index,                              # number of column indices
        desc::desc_type                             # descriptor for C(i,:) and mask
)
end

"""
    GrB_Vector_assign(w, mask, accum, x, I, ni, desc)

Assign the same value to a specified subset of vector elements.
With the use of `GrB_ALL`, the entire destination vector can be filled with the constant.
```
"""
function GrB_Vector_assign(                         # w<mask>(I) = accum (w(I),x)
        w::Abstract_GrB_Vector,                     # input/output vector for results
        mask::vector_mask_type,                     # optional mask for w, unused if NULL
        accum::accum_type,                          # optional accum for Z=accum(w(I),x)
        x,                                          # scalar to assign to w(I)
        I::indices_type,                            # row indices
        ni::GrB_Index,                              # number of row indices
        desc::desc_type                             # descriptor for w and mask
)
end

"""
    GrB_Matrix_assign(C, Mask, accum, x, I, ni, J, nj, desc)

Assign the same value to a specified subset of matrix elements.
With the use of `GrB_ALL`, the entire destination matrix can be filled with the constant.
"""
function GrB_Matrix_assign(                         # C<Mask>(I,J) = accum (C(I,J),x)
        C::Abstract_GrB_Matrix,                     # input/output matrix for results
        Mask::matrix_mask_type,                     # optional mask for C, unused if NULL
        accum::accum_type,                          # optional accum for Z=accum(C(I,J),x)
        x,                                          # scalar to assign to C(I,J)
        I::indices_type,                            # row indices
        ni::GrB_Index,                              # number of row indices
        J::indices_type,                            # column indices
        nj::GrB_Index,                              # number of column indices
        desc::desc_type                             # descriptor for C and Mask
)
end
