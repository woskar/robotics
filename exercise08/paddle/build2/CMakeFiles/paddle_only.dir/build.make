# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/robo/exercise08/paddle

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/robo/exercise08/paddle/build2

# Include any dependencies generated for this target.
include CMakeFiles/paddle_only.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/paddle_only.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/paddle_only.dir/flags.make

CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o: CMakeFiles/paddle_only.dir/flags.make
CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o: ../main_paddle_only.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/robo/exercise08/paddle/build2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o -c /home/robo/exercise08/paddle/main_paddle_only.cpp

CMakeFiles/paddle_only.dir/main_paddle_only.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/paddle_only.dir/main_paddle_only.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/robo/exercise08/paddle/main_paddle_only.cpp > CMakeFiles/paddle_only.dir/main_paddle_only.cpp.i

CMakeFiles/paddle_only.dir/main_paddle_only.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/paddle_only.dir/main_paddle_only.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/robo/exercise08/paddle/main_paddle_only.cpp -o CMakeFiles/paddle_only.dir/main_paddle_only.cpp.s

CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o.requires:

.PHONY : CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o.requires

CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o.provides: CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o.requires
	$(MAKE) -f CMakeFiles/paddle_only.dir/build.make CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o.provides.build
.PHONY : CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o.provides

CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o.provides.build: CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o


CMakeFiles/paddle_only.dir/paddle.cpp.o: CMakeFiles/paddle_only.dir/flags.make
CMakeFiles/paddle_only.dir/paddle.cpp.o: ../paddle.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/robo/exercise08/paddle/build2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/paddle_only.dir/paddle.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/paddle_only.dir/paddle.cpp.o -c /home/robo/exercise08/paddle/paddle.cpp

CMakeFiles/paddle_only.dir/paddle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/paddle_only.dir/paddle.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/robo/exercise08/paddle/paddle.cpp > CMakeFiles/paddle_only.dir/paddle.cpp.i

CMakeFiles/paddle_only.dir/paddle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/paddle_only.dir/paddle.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/robo/exercise08/paddle/paddle.cpp -o CMakeFiles/paddle_only.dir/paddle.cpp.s

CMakeFiles/paddle_only.dir/paddle.cpp.o.requires:

.PHONY : CMakeFiles/paddle_only.dir/paddle.cpp.o.requires

CMakeFiles/paddle_only.dir/paddle.cpp.o.provides: CMakeFiles/paddle_only.dir/paddle.cpp.o.requires
	$(MAKE) -f CMakeFiles/paddle_only.dir/build.make CMakeFiles/paddle_only.dir/paddle.cpp.o.provides.build
.PHONY : CMakeFiles/paddle_only.dir/paddle.cpp.o.provides

CMakeFiles/paddle_only.dir/paddle.cpp.o.provides.build: CMakeFiles/paddle_only.dir/paddle.cpp.o


# Object files for target paddle_only
paddle_only_OBJECTS = \
"CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o" \
"CMakeFiles/paddle_only.dir/paddle.cpp.o"

# External object files for target paddle_only
paddle_only_EXTERNAL_OBJECTS =

paddle_only: CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o
paddle_only: CMakeFiles/paddle_only.dir/paddle.cpp.o
paddle_only: CMakeFiles/paddle_only.dir/build.make
paddle_only: CMakeFiles/paddle_only.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/robo/exercise08/paddle/build2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable paddle_only"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/paddle_only.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/paddle_only.dir/build: paddle_only

.PHONY : CMakeFiles/paddle_only.dir/build

CMakeFiles/paddle_only.dir/requires: CMakeFiles/paddle_only.dir/main_paddle_only.cpp.o.requires
CMakeFiles/paddle_only.dir/requires: CMakeFiles/paddle_only.dir/paddle.cpp.o.requires

.PHONY : CMakeFiles/paddle_only.dir/requires

CMakeFiles/paddle_only.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/paddle_only.dir/cmake_clean.cmake
.PHONY : CMakeFiles/paddle_only.dir/clean

CMakeFiles/paddle_only.dir/depend:
	cd /home/robo/exercise08/paddle/build2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robo/exercise08/paddle /home/robo/exercise08/paddle /home/robo/exercise08/paddle/build2 /home/robo/exercise08/paddle/build2 /home/robo/exercise08/paddle/build2/CMakeFiles/paddle_only.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/paddle_only.dir/depend

