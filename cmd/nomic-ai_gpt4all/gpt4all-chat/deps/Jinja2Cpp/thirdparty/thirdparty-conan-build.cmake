message(STATUS "'conan-build' dependencies mode selected for Jinja2Cpp. All dependencies are taken as a conan packages")

find_package(expected-lite REQUIRED)
find_package(variant-lite REQUIRED)
find_package(optional-lite REQUIRED)
find_package(string-view-lite REQUIRED)
find_package(nlohmann_json REQUIRED)

find_package(Boost COMPONENTS algorithm filesystem numeric_conversion json optional variant regex REQUIRED)
find_package(fmt REQUIRED)
find_package(RapidJSON REQUIRED)

set(JINJA2_PRIVATE_LIBS_INT Boost::headers Boost::filesystem Boost::numeric_conversion)
set(JINJA2_PUBLIC_LIBS_INT Boost::json fmt::fmt rapidjson Boost::regex
    nlohmann_json::nlohmann_json nonstd::expected-lite nonstd::variant-lite nonstd::optional-lite nonstd::string-view-lite)
