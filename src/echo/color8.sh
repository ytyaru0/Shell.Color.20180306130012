# https://en.wikipedia.org/wiki/ANSI_escape_code

function SGR () {
    #echo "\[\033[$1m\]" #PS1に代入するときはこっち
    echo "\033[$1m"
}
# 引数を;区切にする
function Array () {
    for x in "$@"
    do
        local ret="$ret$x;"
    done
    local ret=`echo $ret | sed -e 's/;$//'`
    echo $ret
}
function Color8 () {
    echo `Array 38 5 $1`
}
function BackgroundColor8 () {
    echo `Array 48 5 $1`
}

function Program () {
    for x in $(seq 0 255) ; do
        local ansi=`SGR $(Color8 $x)`
        echo -n -e "$ansi$x "
    done
    echo 
    for x in $(seq 0 255) 0 ; do
        local ansi=`SGR $(BackgroundColor8 $x)`
        echo -n -e "$ansi$x "
    done
    echo 
}

Program
