include(FetchContent)

FetchContent_Declare(
    expected-lite
    # v0.8.0
    URL https://github.com/martinmoene/expected-lite/archive/182165b584dad130afaf4bcd25b8629799baea38.tar.gz
    URL_HASH SHA256=e7fc5149e29a35673e872b2f4e3a40ce190bba593f1247267d035fe1134bc222
)
FetchContent_MakeAvailable(expected-lite)

FetchContent_Declare(
    variant-lite
    URL https://github.com/martinmoene/variant-lite/archive/5015e841cf143487f2d7e2f619b618d455658fab.tar.gz
    URL_HASH SHA256=d343cfa347517a2ee318864f3e2a08af8e17e699de701c69c1cdbdab79d9331f
)
FetchContent_MakeAvailable(variant-lite)

FetchContent_Declare(
    optional-lite
    URL https://github.com/martinmoene/optional-lite/archive/2605a4b13094b0bf7a8ecdcde6d644370105bce5.tar.gz
    URL_HASH SHA256=29d5ca8d24d1174bf3e933d2e5186f7d1dab3a4cfe7befbe0f0d2795e53e3e0d
)
FetchContent_MakeAvailable(optional-lite)

FetchContent_Declare(
    string-view-lite
    URL https://github.com/martinmoene/string-view-lite/archive/a47222b9855dd6e6d1eac38acaa495822e2caa69.tar.gz
    URL_HASH SHA256=cdc7de644d9a67780552890b7ff0fdd9bf9dc16da97b2578410578f94272b0ea
)
FetchContent_MakeAvailable(string-view-lite)

if (NOT TARGET fmt::fmt)
    set (FMT_INSTALL ON CACHE BOOL "" FORCE)
    FetchContent_Declare(
        fmt
        URL https://github.com/fmtlib/fmt/archive/refs/tags/10.2.1.tar.gz
        URL_HASH SHA256=1250e4cc58bf06ee631567523f48848dc4596133e163f02615c97f78bab6c811
    )
    FetchContent_MakeAvailable(fmt)
endif()

set (RAPIDJSON_BUILD_DOC OFF CACHE BOOL "" FORCE)
set (RAPIDJSON_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set (RAPIDJSON_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set (RAPIDJSON_BUILD_THIRDPARTY_GTEST OFF CACHE BOOL "" FORCE)
set (RAPIDJSON_ENABLE_INSTRUMENTATION_OPT OFF CACHE BOOL "" FORCE)

if (NOT TARGET RapidJSON::RapidJSON)
    FetchContent_Declare(
        rapidjson
        #    GIT_TAG f9d53419e912910fd8fa57d5705fa41425428c35 - latest but broken revision
        URL https://github.com/Tencent/rapidjson/archive/973dc9c06dcd3d035ebd039cfb9ea457721ec213.tar.gz
        URL_HASH SHA256=d0c9e52823d493206eb721d38cb3a669ca0212360862bd15a3c2f7d35ea7c6f7
    )
    FetchContent_MakeAvailable(rapidjson)

    find_package(RapidJSON REQUIRED
                 PATHS "${rapidjson_BINARY_DIR}"
                 NO_DEFAULT_PATH)

    add_library(RapidJSON INTERFACE)
    add_library(RapidJSON::RapidJSON ALIAS RapidJSON)
    target_include_directories(RapidJSON
        INTERFACE
            $<BUILD_INTERFACE:${RapidJSON_INCLUDE_DIR}>
            $<INSTALL_INTERFACE:include>
    )

    install (TARGETS RapidJSON
        EXPORT InstallTargets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static
    )
endif()

if (JINJA2CPP_BUILD_TESTS)
    set (JSON_BuildTests OFF CACHE BOOL "" FORCE)
    set (JSON_Install OFF CACHE BOOL "" FORCE)
    set (JSON_MultipleHeaders ON CACHE BOOL "" FORCE)

    FetchContent_Declare(
        nlohmann_json
        URL https://github.com/nlohmann/json/archive/8c391e04fe4195d8be862c97f38cfe10e2a3472e.tar.gz
        URL_HASH SHA256=8ca375182e9557612f043eaa62dfc4224b41ddf07af704577666aadb7dd99a79
    )
    FetchContent_MakeAvailable(nlohmann_json)
endif()

install (FILES
        ${expected_lite_SOURCE_DIR}/include/nonstd/expected.hpp
        ${variant_lite_SOURCE_DIR}/include/nonstd/variant.hpp
        ${optional_lite_SOURCE_DIR}/include/nonstd/optional.hpp
        ${string_view_lite_SOURCE_DIR}/include/nonstd/string_view.hpp
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nonstd)
