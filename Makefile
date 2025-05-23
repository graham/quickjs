# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/graham/submodules/quickjs

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/graham/submodules/quickjs

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components
.PHONY : list_install_components/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local/fast

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/graham/submodules/quickjs/CMakeFiles /home/graham/submodules/quickjs//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/graham/submodules/quickjs/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named qjs

# Build rule for target.
qjs: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 qjs
.PHONY : qjs

# fast build rule for target.
qjs/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/build
.PHONY : qjs/fast

#=============================================================================
# Target rules for targets named qjsc

# Build rule for target.
qjsc: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 qjsc
.PHONY : qjsc

# fast build rule for target.
qjsc/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjsc.dir/build.make CMakeFiles/qjsc.dir/build
.PHONY : qjsc/fast

#=============================================================================
# Target rules for targets named qjs_exe

# Build rule for target.
qjs_exe: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 qjs_exe
.PHONY : qjs_exe

# fast build rule for target.
qjs_exe/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/build
.PHONY : qjs_exe/fast

#=============================================================================
# Target rules for targets named run-test262

# Build rule for target.
run-test262: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 run-test262
.PHONY : run-test262

# fast build rule for target.
run-test262/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/run-test262.dir/build.make CMakeFiles/run-test262.dir/build
.PHONY : run-test262/fast

#=============================================================================
# Target rules for targets named api-test

# Build rule for target.
api-test: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 api-test
.PHONY : api-test

# fast build rule for target.
api-test/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/api-test.dir/build.make CMakeFiles/api-test.dir/build
.PHONY : api-test/fast

#=============================================================================
# Target rules for targets named unicode_gen

# Build rule for target.
unicode_gen: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 unicode_gen
.PHONY : unicode_gen

# fast build rule for target.
unicode_gen/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/build
.PHONY : unicode_gen/fast

#=============================================================================
# Target rules for targets named function_source

# Build rule for target.
function_source: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 function_source
.PHONY : function_source

# fast build rule for target.
function_source/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/function_source.dir/build.make CMakeFiles/function_source.dir/build
.PHONY : function_source/fast

api-test.o: api-test.c.o
.PHONY : api-test.o

# target to build an object file
api-test.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/api-test.dir/build.make CMakeFiles/api-test.dir/api-test.c.o
.PHONY : api-test.c.o

api-test.i: api-test.c.i
.PHONY : api-test.i

# target to preprocess a source file
api-test.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/api-test.dir/build.make CMakeFiles/api-test.dir/api-test.c.i
.PHONY : api-test.c.i

api-test.s: api-test.c.s
.PHONY : api-test.s

# target to generate assembly for a file
api-test.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/api-test.dir/build.make CMakeFiles/api-test.dir/api-test.c.s
.PHONY : api-test.c.s

cutils.o: cutils.c.o
.PHONY : cutils.o

# target to build an object file
cutils.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/cutils.c.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/cutils.c.o
.PHONY : cutils.c.o

cutils.i: cutils.c.i
.PHONY : cutils.i

# target to preprocess a source file
cutils.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/cutils.c.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/cutils.c.i
.PHONY : cutils.c.i

cutils.s: cutils.c.s
.PHONY : cutils.s

# target to generate assembly for a file
cutils.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/cutils.c.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/cutils.c.s
.PHONY : cutils.c.s

gen/function_source.o: gen/function_source.c.o
.PHONY : gen/function_source.o

# target to build an object file
gen/function_source.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/function_source.dir/build.make CMakeFiles/function_source.dir/gen/function_source.c.o
.PHONY : gen/function_source.c.o

gen/function_source.i: gen/function_source.c.i
.PHONY : gen/function_source.i

# target to preprocess a source file
gen/function_source.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/function_source.dir/build.make CMakeFiles/function_source.dir/gen/function_source.c.i
.PHONY : gen/function_source.c.i

gen/function_source.s: gen/function_source.c.s
.PHONY : gen/function_source.s

# target to generate assembly for a file
gen/function_source.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/function_source.dir/build.make CMakeFiles/function_source.dir/gen/function_source.c.s
.PHONY : gen/function_source.c.s

gen/repl.o: gen/repl.c.o
.PHONY : gen/repl.o

# target to build an object file
gen/repl.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/gen/repl.c.o
.PHONY : gen/repl.c.o

gen/repl.i: gen/repl.c.i
.PHONY : gen/repl.i

# target to preprocess a source file
gen/repl.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/gen/repl.c.i
.PHONY : gen/repl.c.i

gen/repl.s: gen/repl.c.s
.PHONY : gen/repl.s

# target to generate assembly for a file
gen/repl.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/gen/repl.c.s
.PHONY : gen/repl.c.s

gen/standalone.o: gen/standalone.c.o
.PHONY : gen/standalone.o

# target to build an object file
gen/standalone.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/gen/standalone.c.o
.PHONY : gen/standalone.c.o

gen/standalone.i: gen/standalone.c.i
.PHONY : gen/standalone.i

# target to preprocess a source file
gen/standalone.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/gen/standalone.c.i
.PHONY : gen/standalone.c.i

gen/standalone.s: gen/standalone.c.s
.PHONY : gen/standalone.s

# target to generate assembly for a file
gen/standalone.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/gen/standalone.c.s
.PHONY : gen/standalone.c.s

libregexp.o: libregexp.c.o
.PHONY : libregexp.o

# target to build an object file
libregexp.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/libregexp.c.o
.PHONY : libregexp.c.o

libregexp.i: libregexp.c.i
.PHONY : libregexp.i

# target to preprocess a source file
libregexp.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/libregexp.c.i
.PHONY : libregexp.c.i

libregexp.s: libregexp.c.s
.PHONY : libregexp.s

# target to generate assembly for a file
libregexp.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/libregexp.c.s
.PHONY : libregexp.c.s

libunicode.o: libunicode.c.o
.PHONY : libunicode.o

# target to build an object file
libunicode.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/libunicode.c.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/libunicode.c.o
.PHONY : libunicode.c.o

libunicode.i: libunicode.c.i
.PHONY : libunicode.i

# target to preprocess a source file
libunicode.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/libunicode.c.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/libunicode.c.i
.PHONY : libunicode.c.i

libunicode.s: libunicode.c.s
.PHONY : libunicode.s

# target to generate assembly for a file
libunicode.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/libunicode.c.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/libunicode.c.s
.PHONY : libunicode.c.s

qjs.o: qjs.c.o
.PHONY : qjs.o

# target to build an object file
qjs.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/qjs.c.o
.PHONY : qjs.c.o

qjs.i: qjs.c.i
.PHONY : qjs.i

# target to preprocess a source file
qjs.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/qjs.c.i
.PHONY : qjs.c.i

qjs.s: qjs.c.s
.PHONY : qjs.s

# target to generate assembly for a file
qjs.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/qjs.c.s
.PHONY : qjs.c.s

qjsc.o: qjsc.c.o
.PHONY : qjsc.o

# target to build an object file
qjsc.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjsc.dir/build.make CMakeFiles/qjsc.dir/qjsc.c.o
.PHONY : qjsc.c.o

qjsc.i: qjsc.c.i
.PHONY : qjsc.i

# target to preprocess a source file
qjsc.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjsc.dir/build.make CMakeFiles/qjsc.dir/qjsc.c.i
.PHONY : qjsc.c.i

qjsc.s: qjsc.c.s
.PHONY : qjsc.s

# target to generate assembly for a file
qjsc.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjsc.dir/build.make CMakeFiles/qjsc.dir/qjsc.c.s
.PHONY : qjsc.c.s

quickjs-libc.o: quickjs-libc.c.o
.PHONY : quickjs-libc.o

# target to build an object file
quickjs-libc.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjsc.dir/build.make CMakeFiles/qjsc.dir/quickjs-libc.c.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/quickjs-libc.c.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/run-test262.dir/build.make CMakeFiles/run-test262.dir/quickjs-libc.c.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/function_source.dir/build.make CMakeFiles/function_source.dir/quickjs-libc.c.o
.PHONY : quickjs-libc.c.o

quickjs-libc.i: quickjs-libc.c.i
.PHONY : quickjs-libc.i

# target to preprocess a source file
quickjs-libc.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjsc.dir/build.make CMakeFiles/qjsc.dir/quickjs-libc.c.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/quickjs-libc.c.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/run-test262.dir/build.make CMakeFiles/run-test262.dir/quickjs-libc.c.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/function_source.dir/build.make CMakeFiles/function_source.dir/quickjs-libc.c.i
.PHONY : quickjs-libc.c.i

quickjs-libc.s: quickjs-libc.c.s
.PHONY : quickjs-libc.s

# target to generate assembly for a file
quickjs-libc.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjsc.dir/build.make CMakeFiles/qjsc.dir/quickjs-libc.c.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs_exe.dir/build.make CMakeFiles/qjs_exe.dir/quickjs-libc.c.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/run-test262.dir/build.make CMakeFiles/run-test262.dir/quickjs-libc.c.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/function_source.dir/build.make CMakeFiles/function_source.dir/quickjs-libc.c.s
.PHONY : quickjs-libc.c.s

quickjs.o: quickjs.c.o
.PHONY : quickjs.o

# target to build an object file
quickjs.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/quickjs.c.o
.PHONY : quickjs.c.o

quickjs.i: quickjs.c.i
.PHONY : quickjs.i

# target to preprocess a source file
quickjs.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/quickjs.c.i
.PHONY : quickjs.c.i

quickjs.s: quickjs.c.s
.PHONY : quickjs.s

# target to generate assembly for a file
quickjs.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/quickjs.c.s
.PHONY : quickjs.c.s

run-test262.o: run-test262.c.o
.PHONY : run-test262.o

# target to build an object file
run-test262.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/run-test262.dir/build.make CMakeFiles/run-test262.dir/run-test262.c.o
.PHONY : run-test262.c.o

run-test262.i: run-test262.c.i
.PHONY : run-test262.i

# target to preprocess a source file
run-test262.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/run-test262.dir/build.make CMakeFiles/run-test262.dir/run-test262.c.i
.PHONY : run-test262.c.i

run-test262.s: run-test262.c.s
.PHONY : run-test262.s

# target to generate assembly for a file
run-test262.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/run-test262.dir/build.make CMakeFiles/run-test262.dir/run-test262.c.s
.PHONY : run-test262.c.s

unicode_gen.o: unicode_gen.c.o
.PHONY : unicode_gen.o

# target to build an object file
unicode_gen.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/unicode_gen.c.o
.PHONY : unicode_gen.c.o

unicode_gen.i: unicode_gen.c.i
.PHONY : unicode_gen.i

# target to preprocess a source file
unicode_gen.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/unicode_gen.c.i
.PHONY : unicode_gen.c.i

unicode_gen.s: unicode_gen.c.s
.PHONY : unicode_gen.s

# target to generate assembly for a file
unicode_gen.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/unicode_gen.dir/build.make CMakeFiles/unicode_gen.dir/unicode_gen.c.s
.PHONY : unicode_gen.c.s

xsum.o: xsum.c.o
.PHONY : xsum.o

# target to build an object file
xsum.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/xsum.c.o
.PHONY : xsum.c.o

xsum.i: xsum.c.i
.PHONY : xsum.i

# target to preprocess a source file
xsum.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/xsum.c.i
.PHONY : xsum.c.i

xsum.s: xsum.c.s
.PHONY : xsum.s

# target to generate assembly for a file
xsum.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/qjs.dir/build.make CMakeFiles/qjs.dir/xsum.c.s
.PHONY : xsum.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... install"
	@echo "... install/local"
	@echo "... install/strip"
	@echo "... list_install_components"
	@echo "... rebuild_cache"
	@echo "... api-test"
	@echo "... function_source"
	@echo "... qjs"
	@echo "... qjs_exe"
	@echo "... qjsc"
	@echo "... run-test262"
	@echo "... unicode_gen"
	@echo "... api-test.o"
	@echo "... api-test.i"
	@echo "... api-test.s"
	@echo "... cutils.o"
	@echo "... cutils.i"
	@echo "... cutils.s"
	@echo "... gen/function_source.o"
	@echo "... gen/function_source.i"
	@echo "... gen/function_source.s"
	@echo "... gen/repl.o"
	@echo "... gen/repl.i"
	@echo "... gen/repl.s"
	@echo "... gen/standalone.o"
	@echo "... gen/standalone.i"
	@echo "... gen/standalone.s"
	@echo "... libregexp.o"
	@echo "... libregexp.i"
	@echo "... libregexp.s"
	@echo "... libunicode.o"
	@echo "... libunicode.i"
	@echo "... libunicode.s"
	@echo "... qjs.o"
	@echo "... qjs.i"
	@echo "... qjs.s"
	@echo "... qjsc.o"
	@echo "... qjsc.i"
	@echo "... qjsc.s"
	@echo "... quickjs-libc.o"
	@echo "... quickjs-libc.i"
	@echo "... quickjs-libc.s"
	@echo "... quickjs.o"
	@echo "... quickjs.i"
	@echo "... quickjs.s"
	@echo "... run-test262.o"
	@echo "... run-test262.i"
	@echo "... run-test262.s"
	@echo "... unicode_gen.o"
	@echo "... unicode_gen.i"
	@echo "... unicode_gen.s"
	@echo "... xsum.o"
	@echo "... xsum.i"
	@echo "... xsum.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

