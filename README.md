# imgui-starter
a premake template for imgui project using glfw and opengl3
works on linux, windows, mac osx (not tested) 

# Usage
For clone this project use "git clone --recurse-submodules https://github.com/IScRyI/imgui-starter.git".
To rename your project open premake5.lua and change the string to the line starting with project.
To compile the project, run the premake script with one of the arguments below : 

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
 
If you use the makefile the compilation is done by default in the Debug mode to compile in Release mode used this argument : config=release_x86_64.
For problems related to the use of premake read this : https://premake.github.io/docs/Your-First-Script.

Attention if you modify the name of the project after having compiled a first time do not forget to execute the command "make clean" is to go suprimer Makefile in the libraries is the core of the project.
