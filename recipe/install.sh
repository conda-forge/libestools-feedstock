set -exou

mkdir -p "${PREFIX}/lib"
cp -P lib/lib*.so.* "${PREFIX}/lib/"
