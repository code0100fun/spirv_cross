import code0100fun.spirv_cross
import os

fn on_error(mut userdata spirv_cross.SPVCContext, error string) {
    println('error: $error')
}

fn main() {
    context, ctx_result := spirv_cross.context_create()
    println('context_create result: $ctx_result')
    context.set_error_callback(on_error, context)

    spirv := os.read_bytes('thirdparty/SPIRV-Cross/tests-other/c_api_test.spv') or {
        panic('failed to read SPIR-V file')
    }
    ir, parse_result := context.parse_spirv(spirv)
    println('parse_spirv result: $parse_result')
    compiler, create_result := context.create_compiler(.glsl, ir, .take_ownership)
    println('create_compiler result: $create_result')
    resources, res_result := compiler.create_shader_resources()
    println('create_shader_resources result: $res_result')
    reflected, refl_result := resources.get_resource_list_for_type(.uniform_buffer)
    println('get_resource_list_for_type result: $refl_result')

    for r in reflected {
        println('ID: $r.id, BaseTypeId: $r.base_type_id, TypeID: $r.type_id, Name: $r.name()')
        set := compiler.get_decoration(r.id, .descriptor_set)
        binding := compiler.get_decoration(r.id, .binding)
        println('  Set: $set, Binding: $binding')
    }

    options, opt_result := compiler.create_compiler_options()
    println('create_compiler_options result: $opt_result')
    options.set_uint(.glsl_version, 440)
    options.set_bool(.glsl_es, true)
    install_result := compiler.install_compiler_options(options)
    println('install_compiler_options result: $install_result')
    source, comp_result := compiler.compile()
    println('compile result: $comp_result')
    println('---------SOURCE---------')
    println(source)
    println('-------END SOURCE-------')
    context.destroy()
    println('destroyed context')
}
