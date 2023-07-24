set -exou

mkdir -p "${PREFIX}/bin"

cp main/bcat           ${PREFIX}/bin/
cp main/ch_lab         ${PREFIX}/bin/
cp main/ch_track       ${PREFIX}/bin/
cp main/ch_utt         ${PREFIX}/bin/
cp main/ch_wave        ${PREFIX}/bin/
cp main/dp             ${PREFIX}/bin/
cp main/na_play        ${PREFIX}/bin/
cp main/na_record      ${PREFIX}/bin/
cp main/ngram_build    ${PREFIX}/bin/
cp main/ngram_test     ${PREFIX}/bin/
cp main/ols            ${PREFIX}/bin/
cp main/ols_test       ${PREFIX}/bin/
cp main/pda            ${PREFIX}/bin/
cp main/pitchmark      ${PREFIX}/bin/
cp main/scfg_make      ${PREFIX}/bin/
cp main/scfg_parse     ${PREFIX}/bin/
cp main/scfg_test      ${PREFIX}/bin/
cp main/scfg_train     ${PREFIX}/bin/
cp main/sig2fv         ${PREFIX}/bin/
cp main/sigfilter      ${PREFIX}/bin/
cp main/siod           ${PREFIX}/bin/
cp main/spectgen       ${PREFIX}/bin/
cp main/tilt_analysis  ${PREFIX}/bin/
cp main/tilt_synthesis ${PREFIX}/bin/
cp main/viterbi        ${PREFIX}/bin/
cp main/wagon          ${PREFIX}/bin/
cp main/wagon_test     ${PREFIX}/bin/
cp main/wfst_build     ${PREFIX}/bin/
cp main/wfst_run       ${PREFIX}/bin/
