#set -e
. ./assert.sh/assert.sh
. ../ansi.sh

echo $ESC_S
for key in ${!ESC_S[@]};
do
    echo $key
    assert "echo $key" "CSI"
    assert "echo ${ESC_S[$key]}" "\033[" # 実行結果から\が消える…… got "033["
    #assert "$(echo ${ESC_S[$key]})" "\033[" # 実行結果が消える…… got nothing
    #assert `echo ${ESC_S[$key]}` "\033[" # 実行結果が消える…… got nothing
    #echo ${ESC_S[$key]}
done


#assert "[ -z $ESC_S ]" "1"
#assert "echo abc" "abC"
assert_end demo

