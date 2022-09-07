BUILD:=build
ifeq ($(OS),Windows_NT)
	LIB_OUTPUT=$(BUILD)/SPIRV-Cross/libspirv-cross-c.dll
else
	LIB_OUTPUT=$(BUILD)/SPIRV-Cross/libspirv-cross-c.a
endif

all: $(LIB_OUTPUT)

$(BUILD):
	mkdir -p $(BUILD)

$(LIB_OUTPUT): $(BUILD)
	cd $(BUILD) ; cmake -GNinja ../thirdparty ; cmake --build .

run: $(LIB_OUTPUT)
	v run examples/cross_compile.v

clean:
	-rm -rf $(BUILD)
