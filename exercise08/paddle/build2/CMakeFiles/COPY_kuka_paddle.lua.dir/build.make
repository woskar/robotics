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

# Utility rule file for COPY_kuka_paddle.lua.

# Include the progress variables for this target.
include CMakeFiles/COPY_kuka_paddle.lua.dir/progress.make

CMakeFiles/COPY_kuka_paddle.lua: kuka_paddle.lua


kuka_paddle.lua: ../cmake/copySrc.cmake.in
kuka_paddle.lua: ../config/kuka_paddle.lua
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/robo/exercise08/paddle/build2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Copying kuka_paddle.lua -> kuka_paddle.lua to binary tree"
	/usr/bin/cmake -P /home/robo/exercise08/paddle/build2/CMakeFiles/kuka_paddle.lua.cmake

COPY_kuka_paddle.lua: CMakeFiles/COPY_kuka_paddle.lua
COPY_kuka_paddle.lua: kuka_paddle.lua
COPY_kuka_paddle.lua: CMakeFiles/COPY_kuka_paddle.lua.dir/build.make

.PHONY : COPY_kuka_paddle.lua

# Rule to build all files generated by this target.
CMakeFiles/COPY_kuka_paddle.lua.dir/build: COPY_kuka_paddle.lua

.PHONY : CMakeFiles/COPY_kuka_paddle.lua.dir/build

CMakeFiles/COPY_kuka_paddle.lua.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/COPY_kuka_paddle.lua.dir/cmake_clean.cmake
.PHONY : CMakeFiles/COPY_kuka_paddle.lua.dir/clean

CMakeFiles/COPY_kuka_paddle.lua.dir/depend:
	cd /home/robo/exercise08/paddle/build2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robo/exercise08/paddle /home/robo/exercise08/paddle /home/robo/exercise08/paddle/build2 /home/robo/exercise08/paddle/build2 /home/robo/exercise08/paddle/build2/CMakeFiles/COPY_kuka_paddle.lua.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/COPY_kuka_paddle.lua.dir/depend

