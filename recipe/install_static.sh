set -exou

mkdir -p "${PREFIX}/lib"
mkdir -p "${PREFIX}/lib/speech_tools/lib"

cp lib/lib*.a "${PREFIX}/lib/"

# Some parts of the libraries may need these crazy links...
ln -s "${PREFIX}/lib/libestbase.a"     "${PREFIX}/lib/speech_tools/lib/libestbase.a"
ln -s "${PREFIX}/lib/libeststring.a"   "${PREFIX}/lib/speech_tools/lib/libeststring.a"
ln -s "${PREFIX}/lib/libestools.a"     "${PREFIX}/lib/speech_tools/lib/libestools.a"
