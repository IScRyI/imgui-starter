local GLFW_DIR  = "libs/glfw"
local IMGUI_DIR = "libs/imgui"

workspace "imgui-starter"
	configurations { "Debug", "Release" }
	objdir ( "obj" )
	
	if os.is64bit() and not os.istarget("windows") then
		platforms "x86_64"
	else
		platforms { "x86", "x86_64" }
	end
	
	filter "platforms:x86"
		architecture "x86"
		
	filter "platforms:x86_64"
		architecture "x86_64"
		
	filter "system:macosx"
		xcodebuildsettings {
			["MACOSX_DEPLOYMENT_TARGET"] = "10.9",
			["ALWAYS_SEARCH_USER_PATHS"] = "YES", -- This is the minimum version of macos we'll be able to run on
		};
		
	filter "configurations:Release"
		defines {
			"NDEBUG"
		}
		optimize "Full"
	filter "configurations:Debug*"
		defines {
			"_DEBUG",
		}
		optimize "Debug"
		symbols "On"

outputdir = "build/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"	
group "Dependencies"
	project "glfw"
	project "imgui"
group ""

-- Project (modify here for change project name)
project "Project"
	kind "WindowedApp"
	language "C++"
	
	targetdir (outputdir .. "/%{prj.name}")
	
	defines "_CRT_SECURE_NO_WARNINGS"
	
	files {
		"include/**.h*",
		"src/**.cpp",
	}
	
	includedirs {
		-- Include externals libraries
		path.join(GLFW_DIR, "include"),
		IMGUI_DIR,
		path.join(IMGUI_DIR, "backends"),
		
		-- Include project header
		"include"
	}
	
	links { "glfw", "imgui", }
	
	filter "system:windows"
		links { "gdi32", "kernel32", "psapi" }
	filter "system:linux"
		links { "dl", "GL", "pthread", "X11" }
	filter "system:macosx"
		links { "QuartzCore.framework", "Metal.framework", "Cocoa.framework", "IOKit.framework", "CoreVideo.framework" }
-- External Libraries
		
project "glfw"
	kind "StaticLib"
	language "C"
	location (GLFW_DIR)

	targetdir (outputdir .. "/%{prj.name}")
    
	files {
		path.join(GLFW_DIR, "include/GLFW/*.h"),
		path.join(GLFW_DIR, "src/context.c"),
		path.join(GLFW_DIR, "src/egl_context.*"),
		path.join(GLFW_DIR, "src/init.c"),
		path.join(GLFW_DIR, "src/input.c"),
		path.join(GLFW_DIR, "src/internal.h"),
		path.join(GLFW_DIR, "src/monitor.c"),
		path.join(GLFW_DIR, "src/null*.*"),
		path.join(GLFW_DIR, "src/osmesa_context.*"),
		path.join(GLFW_DIR, "src/platform.c"),
		path.join(GLFW_DIR, "src/vulkan.c"),
		path.join(GLFW_DIR, "src/window.c"),
	}
	includedirs { path.join(GLFW_DIR, "include") }
	filter "system:windows"
		defines "_GLFW_WIN32"
		files {
			path.join(GLFW_DIR, "src/win32_*.*"),
			path.join(GLFW_DIR, "src/wgl_context.*")
		}
	filter "system:linux"
		defines "_GLFW_X11"
		files {
			path.join(GLFW_DIR, "src/glx_context.*"),
			path.join(GLFW_DIR, "src/linux*.*"),
			path.join(GLFW_DIR, "src/posix*.*"),
			path.join(GLFW_DIR, "src/x11*.*"),
			path.join(GLFW_DIR, "src/xkb*.*")
		}
	filter "system:macosx"
		defines "_GLFW_COCOA"
		files {
			path.join(GLFW_DIR, "src/cocoa_*.*"),
			path.join(GLFW_DIR, "src/posix_thread.h"),
			path.join(GLFW_DIR, "src/nsgl_context.h"),
			path.join(GLFW_DIR, "src/egl_context.h"),
			path.join(GLFW_DIR, "src/osmesa_context.h"),

			path.join(GLFW_DIR, "src/posix_thread.c"),
			path.join(GLFW_DIR, "src/nsgl_context.m"),
			path.join(GLFW_DIR, "src/egl_context.c"),
			path.join(GLFW_DIR, "src/nsgl_context.m"),
			path.join(GLFW_DIR, "src/osmesa_context.c"),                       
		}

	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"
		
project "imgui"
	kind "StaticLib"
	language "C++"
	location (IMGUI_DIR)

	targetdir (outputdir .. "/%{prj.name}")
	-- Include glfw for compiling her imgui implementation
    includedirs { path.join(GLFW_DIR, "include") }
		
	files {
		path.join(IMGUI_DIR, "imconfig.h"),
		path.join(IMGUI_DIR, "imgui.h"),
		path.join(IMGUI_DIR, "imgui.cpp"),
		path.join(IMGUI_DIR, "imgui_draw.cpp"),
		path.join(IMGUI_DIR, "imgui_internal.h"),
		path.join(IMGUI_DIR, "imgui_widgets.cpp"),
		path.join(IMGUI_DIR, "imstb_rectpack.h"),
		path.join(IMGUI_DIR, "imstb_textedit.h"),
		path.join(IMGUI_DIR, "imstb_truetype.h"),
		path.join(IMGUI_DIR, "imgui_demo.cpp"),
		path.join(IMGUI_DIR, "imgui_tables.cpp"),
		-- including header for context implementation
		path.join(IMGUI_DIR, "backends/imgui_impl_glfw.h"),
		path.join(IMGUI_DIR, "backends/imgui_impl_glfw.cpp"),
		path.join(IMGUI_DIR, "backends/imgui_impl_opengl3.h"),
		path.join(IMGUI_DIR, "backends/imgui_impl_opengl3_loader.h"),
		path.join(IMGUI_DIR, "backends/imgui_impl_opengl3.cpp"),
	}
	
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"
