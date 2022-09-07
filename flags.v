module spirv_cross

#flag -L @VMODROOT/build/SPIRV-Cross
#flag -I @VMODROOT/thirdparty/SPIRV-Cross
#flag linux -lspirv-cross-c
#flag windows @VMODROOT/build/SPIRV-Cross/libspirv-cross-c-shared.dll
#include "spirv_cross_c.h"
