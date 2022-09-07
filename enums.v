module spirv_cross

pub enum SPVCResult {
    success = C.SPVC_SUCCESS
    error_invalid_spirv = C.SPVC_ERROR_INVALID_SPIRV
    error_unsupported_spirv = C.SPVC_ERROR_UNSUPPORTED_SPIRV
    error_out_of_memory = C.SPVC_ERROR_OUT_OF_MEMORY
    error_invalid_argument = C.SPVC_ERROR_INVALID_ARGUMENT
}

pub enum SPVCBackend {
    glsl = C.SPVC_BACKEND_GLSL
    hlsl = C.SPVC_BACKEND_HLSL
    msl = C.SPVC_BACKEND_MSL
    cpp = C.SPVC_BACKEND_CPP
    json = C.SPVC_BACKEND_JSON
}

pub enum SPVCCaptureMode {
    copy = C.SPVC_CAPTURE_MODE_COPY
    take_ownership = C.SPVC_CAPTURE_MODE_TAKE_OWNERSHIP
}

pub enum SPVCResourceType {
    uniform_buffer = C.SPVC_RESOURCE_TYPE_UNIFORM_BUFFER
    storage_buffer = C.SPVC_RESOURCE_TYPE_STORAGE_BUFFER
    stage_input = C.SPVC_RESOURCE_TYPE_STAGE_INPUT
    stage_output = C.SPVC_RESOURCE_TYPE_STAGE_OUTPUT
    subpass_input = C.SPVC_RESOURCE_TYPE_SUBPASS_INPUT
    storage_image = C.SPVC_RESOURCE_TYPE_STORAGE_IMAGE
    sampled_image = C.SPVC_RESOURCE_TYPE_SAMPLED_IMAGE
    atomic_counter = C.SPVC_RESOURCE_TYPE_ATOMIC_COUNTER
    push_constant = C.SPVC_RESOURCE_TYPE_PUSH_CONSTANT
    separate_image = C.SPVC_RESOURCE_TYPE_SEPARATE_IMAGE
    separate_sampler = C.SPVC_RESOURCE_TYPE_SEPARATE_SAMPLERS
    acceleration_structure = C.SPVC_RESOURCE_TYPE_ACCELERATION_STRUCTURE
    ray_query = C.SPVC_RESOURCE_TYPE_RAY_QUERY
}

pub enum SPVDecoration {
    relaxed_percision = C.SpvDecorationRelaxedPrecision
    spec_id = C.SpvDecorationSpecId
    block = C.SpvDecorationBlock
    buffer_block = C.SpvDecorationBufferBlock
    row_major = C.SpvDecorationRowMajor
    col_major = C.SpvDecorationColMajor
    array_stride = C.SpvDecorationArrayStride
    matrix_stride = C.SpvDecorationMatrixStride
    glsl_shared = C.SpvDecorationGLSLShared
    glsl_packed = C.SpvDecorationGLSLPacked
    cpacked = C.SpvDecorationCPacked
    builtin = C.SpvDecorationBuiltIn
    no_perspective = C.SpvDecorationNoPerspective
    flat = C.SpvDecorationFlat
    patch = C.SpvDecorationPatch
    centroid = C.SpvDecorationCentroid
    sample = C.SpvDecorationSample
    invariant = C.SpvDecorationInvariant
    restrict = C.SpvDecorationRestrict
    aliased = C.SpvDecorationAliased
    @volatile = C.SpvDecorationVolatile
    constant = C.SpvDecorationConstant
    coherent = C.SpvDecorationCoherent
    nonwritable = C.SpvDecorationNonWritable
    nonreadable = C.SpvDecorationNonReadable
    uniform = C.SpvDecorationUniform
    uniform_id = C.SpvDecorationUniformId
    saturated_conversion = C.SpvDecorationSaturatedConversion
    stream = C.SpvDecorationStream
    location = C.SpvDecorationLocation
    component = C.SpvDecorationComponent
    index = C.SpvDecorationIndex
    binding = C.SpvDecorationBinding
    descriptor_set = C.SpvDecorationDescriptorSet
    offset = C.SpvDecorationOffset
    xfb_buffer = C.SpvDecorationXfbBuffer
    xfb_stride = C.SpvDecorationXfbStride
    func_param_attr = C.SpvDecorationFuncParamAttr
    fp_rounding_mode = C.SpvDecorationFPRoundingMode
    fp_fast_math_mode = C.SpvDecorationFPFastMathMode
    linkage_attributes = C.SpvDecorationLinkageAttributes
    no_contraction = C.SpvDecorationNoContraction
    input_attachment_index = C.SpvDecorationInputAttachmentIndex
    alignment = C.SpvDecorationAlignment
    max_byte_offset = C.SpvDecorationMaxByteOffset
    alignment_id = C.SpvDecorationAlignmentId
    max_byte_offset_id = C.SpvDecorationMax
    no_signed_wrap = C.SpvDecorationNoSignedWrap
    no_unsigned_wrap = C.SpvDecorationNoUnsignedWrap
    explicit_interp_amd = C.SpvDecorationExplicitInterpAMD
    override_coverage_nv = C.SpvDecorationOverrideCoverageNV
    passthrough_nv = C.SpvDecorationPassthroughNV
    viewport_relative_nv = C.SpvDecorationViewportRelativeNV
    secondary_viewport_relative_nv = C.SpvDecorationSecondaryViewportRelativeNV
    per_primitive_ext = C.SpvDecorationPerPrimitiveEXT
    per_primitive_nv = C.SpvDecorationPerPrimitiveNV
    per_view_nv = C.SpvDecorationPerViewNV
    per_task_nv = C.SpvDecorationPerTaskNV
    per_vertex_khr = C.SpvDecorationPerVertexKHR
    per_vertex_nv = C.SpvDecorationPerVertexNV
    non_uniform = C.SpvDecorationNonUniform
    non_uniform_ext = C.SpvDecorationNonUniformEXT
    restrict_pointer = C.SpvDecorationRestrictPointer
    restrict_pointer_ext = C.SpvDecorationRestrictPointerEXT
    aliased_pointer = C.SpvDecorationAliasedPointer
    aliased_pointer_ext = C.SpvDecorationAliasedPointerEXT
    bindless_sampler_nv = C.SpvDecorationBindlessSamplerNV
    bindless_image_nv = C.SpvDecorationBindlessImageNV
    bound_sampler_nv = C.SpvDecorationBoundSamplerNV
    bound_image_nv = C.SpvDecorationBoundImageNV
    simt_call_intel = C.SpvDecorationSIMTCallINTEL
    referenced_indirectly_intel = C.SpvDecorationReferencedIndirectlyINTEL
    clobber_intel = C.SpvDecorationClobberINTEL
    vector_compute_variable_intel = C.SpvDecorationVectorComputeVariableINTEL
    func_param_io_kind_intel = C.SpvDecorationFuncParamIOKindINTEL
    vector_compute_function_intel = C.SpvDecorationVectorComputeFunctionINTEL
    stack_call_intel = C.SpvDecorationStackCallINTEL
    global_variable_offset_intel = C.SpvDecorationGlobalVariableOffsetINTEL
    coutner_buffer = C.SpvDecorationCounterBuffer
    hlsl_counter_buffer_google = C.SpvDecorationHlslCounterBufferGOOGLE
    hlsl_semantic_google = C.SpvDecorationHlslSemanticGOOGLE
    user_semantic = C.SpvDecorationUserSemantic
    user_type_google = C.SpvDecorationUserTypeGOOGLE
    function_rounding_mode_intel = C.SpvDecorationFunctionRoundingModeINTEL
    // TODO: Add the rest of the decorations
}

pub enum SPVCCompilerOption {
    force_temporary = C.SPVC_COMPILER_OPTION_FORCE_TEMPORARY
    flatten_multidimensional_arrays = C.SPVC_COMPILER_OPTION_FLATTEN_MULTIDIMENSIONAL_ARRAYS
    fixup_depth_convention = C.SPVC_COMPILER_OPTION_FIXUP_DEPTH_CONVENTION
    flip_vertex_y = C.SPVC_COMPILER_OPTION_FLIP_VERTEX_Y
    glsl_support_nonzero_base_instance = C.SPVC_COMPILER_OPTION_GLSL_SUPPORT_NONZERO_BASE_INSTANCE
    glsl_separate_shader_objects = C.SPVC_COMPILER_OPTION_GLSL_SEPARATE_SHADER_OBJECTS
    glsl_enable_420pack_extension = C.SPVC_COMPILER_OPTION_GLSL_ENABLE_420PACK_EXTENSION
    glsl_version = C.SPVC_COMPILER_OPTION_GLSL_VERSION
    glsl_es = C.SPVC_COMPILER_OPTION_GLSL_ES
    glsl_vulkan_semantics = C.SPVC_COMPILER_OPTION_GLSL_VULKAN_SEMANTICS
    glsl_es_default_float_precision_highp = C.SPVC_COMPILER_OPTION_GLSL_ES_DEFAULT_FLOAT_PRECISION_HIGHP
    glsl_es_default_int_precision_highp = C.SPVC_COMPILER_OPTION_GLSL_ES_DEFAULT_INT_PRECISION_HIGHP
    // TODO: Add the rest of the options
}
