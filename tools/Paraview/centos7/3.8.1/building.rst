module add cmake
module add git
module add i-compilers/15.0.2
module add intelmpi/5.0.3
module add hdf5/1.8.12-intel-15.0

Bugs
----

1. missing proper headers:

Add to ParaView-3.8.1/Utilities/Xdmf2/vtk/Testing/Cxx/XdmfTestVTKIO.cxx::

   #include <unistd.h>

2.

Change line 71 in ParaView-3.8.1/Qt/Core/pqServerManagerSelectionModel.h to::

   ClearAndSelect = static_cast<int>(Clear) | static_cast<int>(Select)

3.

Change in ParaView-3.8.1/Applications/ParaView/CMakeLists.txt::

   INCLUDE_DIRECTORIES(
     ${CMAKE_CURRENT_BINARY_DIR}
     ${CMAKE_CURRENT_BINARY_DIR})

to::

   INCLUDE_DIRECTORIES(
     ${CMAKE_CURRENT_BINARY_DIR}
     ${CMAKE_CURRENT_SOURCE_DIR})

Configure
---------

Run::

   cmake ../ParaView-3.8.1 -DCMAKE_C_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicc -DCMAKE_CXX_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicxx -DCMAKE_INSTALL_PREFIX=/pdc/vol/paraview/3.8.1/amd64_co7/intel -DPARAVIEW_USE_MPI=ON -DVTK_USE_SYSTEM_HDF5=ON -DPARAVIEW_USE_SYSTEM_HDF5=ON -DCMAKE_PREFIX_PATH="/pdc/vol/hdf5/1.8.12/intel/15.0" -DVTK_USE_OFFSCREEN=ON -DMPI_C_COMPILE_FLAGS="-xAVX -axCORE-AVX2,CORE-AVX-I" -DMPI_CXX_COMPILE_FLAGS="-xAVX -axCORE-AVX2,CORE-AVX-I"

For Mesa support
----------------

Need to add::

   module add mesa/10.4.5

Bugs
----

For newer versions of Mesa don't set OPENGL_gl_LIBRARY, i.e.::

   cmake ../ParaView-3.8.1 -DCMAKE_C_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicc -DCMAKE_CXX_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicxx -DCMAKE_INSTALL_PREFIX=/pdc/vol/paraview/3.8.1/amd64_co7/intel-mesa -DPARAVIEW_USE_MPI=ON -DVTK_USE_SYSTEM_HDF5=ON -DPARAVIEW_USE_SYSTEM_HDF5=ON -DCMAKE_PREFIX_PATH="/pdc/vol/hdf5/1.8.12/intel/15.0" -DVTK_USE_OFFSCREEN=ON -DPARAVIEW_BUILD_QT_GUI=OFF -DVTK_USE_X=OFF -DOPENGL_INCLUDE_DIR=/pdc/vol/mesa/10.4.5/include -DOPENGL_gl_LIBRARY= -DOPENGL_glu_LIBRARY=/pdc/vol/mesa/10.4.5/lib/libGLU.so -DVTK_OPENGL_HAS_OSMESA=ON -DOSMESA_INCLUDE_DIR=/pdc/vol/mesa/10.4.5/include -DOSMESA_LIBRARY=/pdc/vol/mesa/10.4.5/lib/libOSMesa.so -DMPI_C_COMPILE_FLAGS="-xAVX -axCORE-AVX2,CORE-AVX-I" -DMPI_CXX_COMPILE_FLAGS="-xAVX -axCORE-AVX2,CORE-AVX-I"

