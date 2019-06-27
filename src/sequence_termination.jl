"""
    GrB_wait()

`GrB_wait` forces all pending operations to complete.
Blocking mode is as if `GrB_wait` is called whenever a GraphBLAS method or operation returns to the user.
"""
function GrB_wait() end

"""
    GrB_error()

Each GraphBLAS method and operation returns a `GrB_Info` error code.
`GrB_error` returns additional information on the last error.
"""
function GrB_error() end
