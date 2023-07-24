set -exou

# user_flags.mak is used by downstream packages to configure their build, but we do not want to enforce CC or CXX
sed -i '/^CC =/d' config/user_flags.mak
sed -i '/^CXX =/d' config/user_flags.mak

# Borrowed from Arch linux - substitute #include "EST.h" for #include <speech_tools/EST.h> to ease finding the headers
# See https://github.com/archlinux/svntogit-packages/blob/packages/festival/trunk/PKGBUILD
for i in $(find . -type f -a \( -name '*.h' -o -name '*.cc' -o -name '*.c' -o -name '*.cpp' \) ); do
  sed -i -e 's,"EST.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/\",speech_tools/,g' \
      -e 's,"siod.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/\",speech_tools/,g' \
      -e 's,"instantiate/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/instantiate/\",speech_tools/instantiate/,g' -e 's,"instantiate,instantiate,g' \
      -e 's,"ling_class/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/ling_class/\",speech_tools/ling_class/,g' -e 's,"ling_class,ling_class,g' \
      -e 's,"rxp/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/rxp/\",speech_tools/rxp/,g' -e 's,"rxp,rxp,g' \
      -e 's,"sigpr/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/sigpr/\",speech_tools/sigpr/,g' -e 's,"sigpr,sigpr,g' \
      -e 's,"unix/.*\.h",\<speech_tools/&\>,g' -e 's,speech_tools/unix/\",speech_tools/unix/,g' -e 's,\.h\">,.h\>,g' -e 's,"unix,unix,g' $i
done

mkdir -p "${PREFIX}/include/speech_tools"
mkdir -p "${PREFIX}/include/speech_tools/unix"
mkdir -p "${PREFIX}/include/speech_tools/base_class"
mkdir -p "${PREFIX}/include/speech_tools/instantiate"
mkdir -p "${PREFIX}/include/speech_tools/ling_class"
mkdir -p "${PREFIX}/include/speech_tools/rxp"
mkdir -p "${PREFIX}/include/speech_tools/sigpr"
mkdir -p "${PREFIX}/lib"
mkdir -p "${PREFIX}/lib/speech_tools"
mkdir -p "${PREFIX}/lib/speech_tools/lib/siod"

cp include/*.h "${PREFIX}/include/speech_tools/"
cp include/unix/*.h "${PREFIX}/include/speech_tools/unix/"
cp base_class/*.cc "${PREFIX}/include/speech_tools/base_class/"
cp base_class/*.h "${PREFIX}/include/speech_tools/"
cp include/instantiate/*.h "${PREFIX}/include/speech_tools/instantiate/"
cp include/ling_class/*.h "${PREFIX}/include/speech_tools/ling_class/"
cp include/rxp/*.h "${PREFIX}/include/speech_tools/rxp/"
cp include/sigpr/*.h "${PREFIX}/include/speech_tools/sigpr/"
cp -P lib/lib*.so "${PREFIX}/lib/"
cp -a config "${PREFIX}/lib/speech_tools/"
cp make.include "${PREFIX}/lib/speech_tools/"
cp lib/siod/*.scm "${PREFIX}/lib/speech_tools/lib/siod/"

# Some parts of the libraries may need these crazy links...
ln -s "${PREFIX}/lib/libestbase.so"     "${PREFIX}/lib/speech_tools/lib/libestbase.so"
ln -s "${PREFIX}/lib/libeststring.so"   "${PREFIX}/lib/speech_tools/lib/libeststring.so"
ln -s "${PREFIX}/lib/libestools.so"     "${PREFIX}/lib/speech_tools/lib/libestools.so"
ln -s "${PREFIX}/include/speech_tools"  "${PREFIX}/lib/speech_tools/include"
