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
# $1..$3 = R,G,B = 0..255 (8bit)
function Color24 () {
    echo `Array 38 2 $1 $2 $3`
}
# $1..$3 = R,G,B = 0..255 (8bit)
function BackgroundColor24 () {
    echo `Array 48 2 $1 $2 $3`
}
function Program () {
    for r in $(seq 0 255) ; do
        for g in $(seq 0 255) ; do
            for b in $(seq 0 255) ; do
                local ansi=`SGR $(Color24 $r $g $b)`
                #local ansi=`SGR $(Array 38 2 $r $g $b)`
                echo -n -e "$ansi$r:$g:$b "
            done
        done
    done
    echo 
    for r in $(seq 0 255) ; do
        for g in $(seq 0 255) ; do
            for b in $(seq 0 255) ; do
                local ansi=`SGR $(BackgroundColor24 $r $g $b)`
                #local ansi=`SGR $(Array 48 2 $r $g $b)`
                echo -n -e "$ansi$r:$g:$b "
            done
        done
    done
    echo 
}

Program
