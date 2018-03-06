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

function Program () {
    for x in $(seq 30 38) ; do
        local ansi=`SGR $(Array 01 $x)`
        echo -n -e "$ansi$x "
    done
    echo 
    for x in $(seq 40 48) 0 ; do
        local ansi=`SGR $(Array 01 $x)`
        echo -n -e "$ansi$x "
    done
    echo 
}

Program
