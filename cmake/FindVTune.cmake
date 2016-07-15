# Try to find VTune headers and libraries.
#
# Usage of this module as follows:
#
#     find_package(VTune)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  VTune_PREFIX        Set this variable to the root installation of
#                      VTune if the module has problems finding the
#                      proper installation path.
#
# Variables defined by this module:
#
#  VTune_FOUND              System has VTune libraries and headers
#  VTune_LIBRARIES          The VTune library
#  VTune_INCLUDE_DIRS       The location of VTune headers

find_path(VTune_PREFIX
    NAMES include/ittnotify.h
)

find_library(VTune_LIBRARIES
    NAMES ittnotify
    HINTS ${VTune_PREFIX}/lib ${HILTIDEPS}/lib
)

find_path(VTune_INCLUDE_DIRS
    NAMES ittnotify.h
    HINTS ${VTune_PREFIX}/include ${HILTIDEPS}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(VTune DEFAULT_MSG
    VTune_LIBRARIES
    VTune_INCLUDE_DIRS
)

mark_as_advanced(
    VTune_PREFIX_DIRS
    VTune_LIBRARIES
    VTune_INCLUDE_DIRS
)
