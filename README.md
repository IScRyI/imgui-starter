# imgui-starter
a premake template for imgui project using glfw and opengl3
works on linux, windows, mac osx (not tested) 

# Usage
to rename your project open premake5.lua and change the string to the line starting with project.
to compile the project, run the premake script with one of the arguments below : 

 - vs2022	Generate Visual Studio 2022 project files
 - vs2019	Generate Visual Studio 2019 project files
 - vs2017	Generate Visual Studio 2017 project files
 - vs2015	Generate Visual Studio 2015 project files
 - vs2013	Generate Visual Studio 2013 project files
 - vs2012	Generate Visual Studio 2012 project files
 - vs2010	Generate Visual Studio 2010 project files
 - vs2008	Generate Visual Studio 2008 project files
 - vs2005	Generate Visual Studio 2005 project files
 - gmake	Generate GNU Makefiles (This generator is deprecated by gmake2)
 - gmake2	Generate GNU Makefiles (including Cygwin and MinGW)
 - xcode4	XCode projects
 - codelite	CodeLite projects
 
if you use the makefile the compilation is done by default in the Debug mode to compile in Release mode used this argument : config=release_x86_64.
for problems related to the use of premake read this :  https://premake.github.io/docs/Your-First-Script
