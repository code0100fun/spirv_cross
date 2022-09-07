module spirv_cross

import arrays

const (
    word_size = u64(sizeof(u32))
)

pub fn context_create() (SPVCContext, SPVCResult) {
    context := SPVCContext(C.NULL)
    result := C.spvc_context_create(&context)
    return context, result
}

pub fn (context SPVCContext) destroy() {
    C.spvc_context_destroy(context)
}

pub fn (context SPVCContext) set_error_callback(error_callback ErrorCallback, userdata voidptr) {
    C.spvc_context_set_error_callback(context, fn [error_callback] (userdata voidptr, error charptr) {
        error_string := unsafe { error.vstring() }
        error_callback(userdata, error_string)
    }, userdata)
}

pub fn (context SPVCContext) parse_spirv(spirv []u8) (&SPVCParsedIr, SPVCResult) {
    ir := SPVCParsedIr(C.NULL)
    result := C.spvc_context_parse_spirv(context, spirv.data, u64(spirv.len) / spirv_cross.word_size,
        &ir)
    return &ir, result
}

pub fn (context SPVCContext) create_compiler(backend SPVCBackend, ir SPVCParsedIr, capture_mode SPVCCaptureMode) (&SPVCCompiler, SPVCResult) {
    compiler := SPVCCompiler(C.NULL)
    result := C.spvc_context_create_compiler(context, backend, ir, capture_mode, &compiler)
    return &compiler, result
}

pub fn (compiler SPVCCompiler) create_shader_resources() (SPVCResources, SPVCResult) {
    resources := SPVCResources(C.NULL)
    result := C.spvc_compiler_create_shader_resources(compiler, &resources)
    return resources, result
}

pub fn (compiler SPVCCompiler) create_compiler_options() (SPVCCompilerOptions, SPVCResult) {
    options := SPVCCompilerOptions(C.NULL)
    result := C.spvc_compiler_create_compiler_options(compiler, &options)
    return options, result
}

pub fn (compiler SPVCCompiler) get_decoration(id u32, decoration SPVDecoration) u32 {
    return C.spvc_compiler_get_decoration(compiler, id, decoration)
}

pub fn (compiler SPVCCompiler) install_compiler_options(options SPVCCompilerOptions) SPVCResult {
    return C.spvc_compiler_install_compiler_options(compiler, options)
}

pub fn (compiler SPVCCompiler) compile() (string, SPVCResult) {
    src_ptr := charptr(0)
    result := C.spvc_compiler_compile(compiler, &src_ptr)
    return unsafe { src_ptr.vstring() }, result
}

pub fn (resources SPVCResources) get_resource_list_for_type(resource_type SPVCResourceType) ([]SPVCReflectedResource, SPVCResult) {
    length := u64(0)
    reflected_ptr := unsafe { nil }
    result := C.spvc_resources_get_resource_list_for_type(resources, resource_type, &reflected_ptr,
        &length)
    reflected := unsafe {
        arrays.carray_to_varray<SPVCReflectedResource>(reflected_ptr, int(length))
    }
    return reflected, result
}

pub fn (options SPVCCompilerOptions) set_uint(option SPVCCompilerOption, value u32) SPVCResult {
    return C.spvc_compiler_options_set_uint(options, option, value)
}

pub fn (options SPVCCompilerOptions) set_bool(option SPVCCompilerOption, value bool) SPVCResult {
    return C.spvc_compiler_options_set_bool(options, option, value)
}
