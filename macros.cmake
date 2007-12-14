#
# Macros for cmake
#
%_cmake_lib_suffix64 -DLIB_SUFFIX=64
%__cmake %{_bindir}/cmake

%cmake \
  CFLAGS="${CFLAGS:-%optflags}" ; export CFLAGS ; \
  CXXFLAGS="${CXXFLAGS:-%optflags}" ; export CXXFLAGS ; \
  FFLAGS="${FFLAGS:-%optflags}" ; export FFLAGS ; \
  %__cmake \\\
        -DCMAKE_INSTALL_PREFIX:PATH=%{_prefix} \\\
        -DCMAKE_INSTALL_LIBDIR:PATH=%{_libdir} \\\
        -DINCLUDE_INSTALL_DIR:PATH=%{_includedir} \\\
        -DLIB_INSTALL_DIR:PATH=%{_libdir} \\\
        -DSYSCONF_INSTALL_DIR:PATH=%{_sysconfdir} \\\
        -DSHARE_INSTALL_PREFIX:PATH=%{_datadir} \\\
%if "%{?_lib}" == "lib64" \
        %{?_cmake_lib_suffix64} \\\
%endif \
        -DBUILD_SHARED_LIBS:BOOL=ON