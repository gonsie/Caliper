include_directories("../../src/caliper")

# build the C/C++ CI test apps

set(CALIPER_CI_CXX_TEST_APPS
  ci_test_aggregate
  ci_test_basic
  ci_test_macros)
set(CALIPER_CI_C_TEST_APPS
  ci_test_c_ann
  ci_test_c_snapshot)

foreach(app ${CALIPER_CI_CXX_TEST_APPS})
  add_executable(${app} ${app}.cpp)
  target_link_libraries(${app} caliper)
endforeach()

foreach(app ${CALIPER_CI_C_TEST_APPS})
  add_executable(${app} ${app}.c)
  set_target_properties(${app} PROPERTIES LINKER_LANGUAGE CXX)
  target_link_libraries(${app} caliper)
endforeach()

# add symlinks to the python test driver scripts
set(PYTHON_SCRIPTS
  test_aggregate.py
  test_basictrace.py
  test_c_api.py
  calipertest.py)

foreach(file ${PYTHON_SCRIPTS})
  add_custom_target(${file} ALL
    COMMAND ${CMAKE_COMMAND} -E create_symlink 
      ${CMAKE_CURRENT_SOURCE_DIR}/${file} 
      ${CMAKE_CURRENT_BINARY_DIR}/${file})
endforeach()

add_test(NAME CI_app_tests COMMAND ${PYTHON_EXECUTABLE} -B -m unittest discover -p "test_*.py")
