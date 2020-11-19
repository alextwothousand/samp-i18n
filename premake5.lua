workspace "i18n"
    configurations { "Debug", "Release" }
    location "build"

project "i18n"
    kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    files { "src/**.hpp", "src/**.cpp" }
    architecture "x32"

    includedirs { "lib/sdk", "lib/json/single_include" }

    filter { "system:windows" }
        defines { "WIN32" }
        files { "src/plugin.def" }

    filter { "system:linux" }
        defines { "LINUX" }
        
    filter { "toolset:gcc" }
        buildoptions { "-Wno-attributes", "-include stddef.h" }

    filter { "toolset:gcc", "system:windows" }
        buildoptions { "-include stdint.h" }

    filter { "toolset:clang" }
        buildoptions { "-Wno-ignored-attributes", "-include stddef.h" }

    filter { "configurations:Debug" }
        defines { "DEBUG" }
        symbols "On"

    filter { "configurations:Release" }
        defines { "NDEBUG" }
        optimize "On"