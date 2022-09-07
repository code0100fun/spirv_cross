module spirv_cross

pub type SPVCContext = voidptr
pub type SPVCParsedIr = voidptr
pub type SPVCCompiler = voidptr
pub type SPVCCompilerOptions = voidptr
pub type SPVCResources = voidptr

struct C.spvc_reflected_resource {
pub:
    id           u32
    base_type_id u32
    type_id      u32
    name         charptr
}

pub type SPVCReflectedResource = C.spvc_reflected_resource

pub fn (resource SPVCReflectedResource) name() string {
    return unsafe { resource.name.vstring() }
}
