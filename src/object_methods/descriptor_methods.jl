"""
    GrB_Descriptor_new(desc)

Initialize a descriptor with default field values.
"""
function GrB_Descriptor_new(desc::Abstract_GrB_Descriptor) end

"""
    GrB_Descriptor_set(desc, field, val)

Set the content for a field for an existing descriptor.
"""
function GrB_Descriptor_set(desc::Abstract_GrB_Descriptor, field::GrB_Desc_Field, val::GrB_Desc_Value) end
