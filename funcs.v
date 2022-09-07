module spirv_cross

pub type ErrorCallback = fn (userdata voidptr, error string)

type ErrorCallbackC = fn (userdata voidptr, error charptr)

fn C.spvc_context_create(context &SPVCContext) SPVCResult
fn C.spvc_context_set_error_callback(context SPVCContext, cb ErrorCallbackC, userdata voidptr)
fn C.spvc_context_parse_spirv(context SPVCContext, spirv voidptr, word_count u64, ir &SPVCParsedIr) SPVCResult
fn C.spvc_context_create_compiler(context SPVCContext, backend SPVCBackend, ir SPVCParsedIr, capture_mode SPVCCaptureMode, compiler &SPVCCompiler) SPVCResult
fn C.spvc_compiler_create_shader_resources(compiler SPVCCompiler, resources &SPVCResources) SPVCResult
fn C.spvc_resources_get_resource_list_for_type(resources SPVCResources, resource_type SPVCResourceType, list []SPVCReflectedResource, count &u64) SPVCResult
fn C.spvc_compiler_create_compiler_options(compiler SPVCCompiler, options &SPVCCompilerOptions) SPVCResult
fn C.spvc_compiler_get_decoration(compiler SPVCCompiler, id u32, decoration SPVDecoration) u32
fn C.spvc_compiler_options_set_uint(options SPVCCompilerOptions, option SPVCCompilerOption, value u32) SPVCResult
fn C.spvc_compiler_options_set_bool(options SPVCCompilerOptions, option SPVCCompilerOption, value bool) SPVCResult
fn C.spvc_compiler_install_compiler_options(compiler SPVCCompiler, options SPVCCompilerOptions) SPVCResult
fn C.spvc_compiler_compile(compiler SPVCCompiler, source &charptr) SPVCResult
fn C.spvc_context_destroy(context SPVCContext)
