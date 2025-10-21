project "JOLT"
    location "../../../Build/Build-Files"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    targetdir ("../../../Build/Binaries/" .. OutputDir .. "/Project/Dependencies/%{prj.name}")
    objdir ("../../../Build/Binaries-Intermediate/" .. OutputDir .. "/Project/Dependencies/%{prj.name}")

    files {
          "Jolt/**.h",
          "Jolt/**.cpp",
          "Jolt/**.inl"
    }

    includedirs {
        "."
    }

    defines {
        -- "JPH_OBJECT_STREAM",
        "JPH_DEBUG_RENDERER",
        "JPH_PROFILE_ENABLED",
    }

    filter "system:windows"
        systemversion "latest"
        defines {
            "_CRT_SECURE_NO_WARNINGS",
            "JPH_PLATFORM_WINDOWS"
        }

    filter "system:linux"
        pic "On"
        defines {
            "JPH_PLATFORM_LINUX"
        }
        buildoptions {
            "-Wno-unused-variable",
            "-Wno-unused-but-set-variable",
            "-Wno-comment"
        }

    filter "configurations:Debug"
        defines {
            "DEBUG",
            "JPH_PROFILE_ENABLED",
            "JPH_DEBUG_RENDERER",
            "JPH_ENABLE_ASSERTS"
        }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines {
            "RELEASE",
            "JPH_ENABLE_ASSERTS"
        }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines {
            "DIST",
            "NDEBUG"
        }
        runtime "Release"
        optimize "On"
        symbols "Off"