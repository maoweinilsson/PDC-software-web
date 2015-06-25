On Tegner we compile binaries that will run on both Ivy Bridge and Hasweel CPUs, thus the special MPI_C/CXX_COMPILE_FLAGS.

```
module add cmake
module add git
module add i-compilers/15.0.2
module add intelmpi/5.0.3
module add hdf5/1.8.12-intel-15.0


#cmake ../ParaView-v4.3.1-source -DCMAKE_C_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicc -DCMAKE_CXX_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicxx -DCMAKE_INSTALL_PREFIX=/pdc/vol/paraview/4.3.1/amd64_co7/intel -DPARAVIEW_USE_MPI=ON -DVTK_USE_SYSTEM_HDF5=ON -DCMAKE_PREFIX_PATH="/pdc/vol/hdf5/1.8.12/intel/15.0" -DPARAVIEW_BUILD_QT_GUI=OFF

cmake ../ParaView-v4.3.1-source -DCMAKE_C_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicc -DCMAKE_CXX_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicxx -DCMAKE_INSTALL_PREFIX=/pdc/vol/paraview/4.3.1/amd64_co7/intel -DPARAVIEW_USE_MPI=ON -DVTK_USE_SYSTEM_HDF5=ON -DCMAKE_PREFIX_PATH="/pdc/vol/hdf5/1.8.12/intel/15.0" -DPARAVIEW_BUILD_QT_GUI=OFF -DMPI_C_COMPILE_FLAGS="-xAVX -axCORE-AVX2,CORE-AVX-I" -DMPI_CXX_COMPILE_FLAGS="-xAVX -axCORE-AVX2,CORE-AVX-I"

```

If you want to test with Mesa rendering on the CPUs:

```
module add mesa/10.4.5

#cmake ../ParaView-v4.3.1-source -DCMAKE_C_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicc -DCMAKE_CXX_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicxx -DCMAKE_INSTALL_PREFIX=/pdc/vol/paraview/4.3.1/amd64_co7/intel-mesa -DPARAVIEW_USE_MPI=ON -DVTK_USE_SYSTEM_HDF5=ON -DCMAKE_PREFIX_PATH="/pdc/vol/hdf5/1.8.12/intel/15.0" -DPARAVIEW_BUILD_QT_GUI=OFF -DVTK_USE_X=OFF -DOPENGL_INCLUDE_DIR=/pdc/vol/mesa/10.4.5/include -DOPENGL_gl_LIBRARY=/pdc/vol/mesa/10.4.5/lib/libOSMesa.so -DOPENGL_glu_LIBRARY=/pdc/vol/mesa/10.4.5/lib/libGLU.so -DVTK_OPENGL_HAS_OSMESA=ON -DOSMESA_INCLUDE_DIR=/pdc/vol/mesa/10.4.5/include -DOSMESA_LIBRARY=/pdc/vol/mesa/10.4.5/lib/libOSMesa.so

cmake ../ParaView-v4.3.1-source -DCMAKE_C_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicc -DCMAKE_CXX_COMPILER=/pdc/vol/intelmpi/5.0.3/impi_latest/bin64/mpicxx -DCMAKE_INSTALL_PREFIX=/pdc/vol/paraview/4.3.1/amd64_co7/intel-mesa -DPARAVIEW_USE_MPI=ON -DVTK_USE_SYSTEM_HDF5=ON -DCMAKE_PREFIX_PATH="/pdc/vol/hdf5/1.8.12/intel/15.0" -DPARAVIEW_BUILD_QT_GUI=OFF -DVTK_USE_X=OFF -DOPENGL_INCLUDE_DIR=/pdc/vol/mesa/10.4.5/include -DOPENGL_gl_LIBRARY=/pdc/vol/mesa/10.4.5/lib/libOSMesa.so -DOPENGL_glu_LIBRARY=/pdc/vol/mesa/10.4.5/lib/libGLU.so -DVTK_OPENGL_HAS_OSMESA=ON -DOSMESA_INCLUDE_DIR=/pdc/vol/mesa/10.4.5/include -DOSMESA_LIBRARY=/pdc/vol/mesa/10.4.5/lib/libOSMesa.so -DMPI_C_COMPILE_FLAGS="-xAVX -axCORE-AVX2,CORE-AVX-I" -DMPI_CXX_COMPILE_FLAGS="-xAVX -axCORE-AVX2,CORE-AVX-I"
```
