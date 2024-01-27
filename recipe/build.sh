set -exou

if [[ "$target_platform" == linux-* ]]
  sed -i 's/^ifdef GCC/ifeq "0" "1"/' config/compilers/gcc.mak
  ./configure SHARED=2 DEBUG=1 COMPILER=gcc
else
  ./configure SHARED=2 DEBUG=1 COMPILER=clang
fi

make  # cannot build in parallel, the build system does not support it

make install  # only copies files inside the build directory
