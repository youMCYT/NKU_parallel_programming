# MSVC compiler path (update if VS version changes)
CCBIN     := "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.44.35207/bin/Hostx64/x64/cl.exe"

NVCC      := nvcc
NVCCFLAGS := --threads 1 -ccbin $(CCBIN) -O2
TARGET    := gauss.exe
SRCS      := main.cpp gauss.cu

.PHONY: all clean run

all: $(TARGET)
	@if exist gauss.lib del /q gauss.lib
	@if exist gauss.exp del /q gauss.exp
	@echo Done: $(TARGET)

run: $(TARGET)
	@if exist gauss.lib del /q gauss.lib
	@if exist gauss.exp del /q gauss.exp
	@$(TARGET)

$(TARGET): $(SRCS)
	@echo Compiling $^ to $@
	@$(NVCC) $(NVCCFLAGS) -o $@ $^

clean:
	@if exist $(TARGET) del /q $(TARGET)
	@if exist gauss.lib del /q gauss.lib
	@if exist gauss.exp del /q gauss.exp
	@echo Done: clean
