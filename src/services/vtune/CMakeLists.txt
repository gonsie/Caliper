include_directories(${VTune_INCLUDE_DIRS})

set(CALIPER_VTUNE_SOURCES
  VTune.cpp)

add_library(caliper-vtune OBJECT ${CALIPER_VTUNE_SOURCES})

add_service_objlib("caliper-vtune")
add_caliper_service("vtune CALIPER_HAVE_VTUNE")
