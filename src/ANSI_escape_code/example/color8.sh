# https://en.wikipedia.org/wiki/ANSI_escape_code

<< "#__CO__"
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
#__CO__

function Program () {
    . ../ansi.sh
    . ../SGR_P.sh
    . ../color8_define.sh
    echo -e `SGR_RESET`
    echo "----- Standard colors -----"
    for x in `GetStandardColors` ; do
        local ansi=`SGR $(Color8 $x)`
        #echo -n -e "$ansi$x "
        local values="$values$ansi$x "
    done
    #echo -e `SGR_RESET`
    echo -e "$values`SGR_RESET`"
    unset values

    echo "----- Bright colors -----"
    for x in `GetBrightColors` ; do
        local ansi=`SGR $(Color8 $x)`
        #echo -n -e "$ansi$x "
        local values="$values$ansi$x "
    done
    #echo -e `SGR_RESET`
    echo -e "$values`SGR_RESET`"
    unset values

    echo "----- Gray scale -----"
    for x in `GetGrayScale` ; do
        local ansi=`SGR $(Color8 $x)`
        #echo -n -e "$ansi$x "
        local values="$values$ansi$x "
    done
    #echo -e `SGR_RESET`
    echo -e "$values`SGR_RESET`"
    unset values

    echo "----- 216 color -----"
    for R in `seq 0 5` ; do
        for G in `seq 0 5` ; do
            for B in `seq 0 5` ; do
                local ansi=`SGR $(Color8 $(GetColor $R $G $B))`
                #echo -n -e "$ansi$R$G$B "
                local values="$values$ansi$R$G$B "
            done
        done
    done
    #echo -e `SGR_RESET`
    echo -e "$values`SGR_RESET`"
    unset values

    echo "----- 256 colors -----"
    for x in $(seq 0 255) ; do
        local ansi=`SGR $(Color8 $x)`
        #echo -n -e "$ansi$x "
        #echo -n -e "`SGR $(Color8 $x)`$x "
        local values="$values$ansi$x "
    done
    #echo -e `SGR_RESET`
    echo -e "$values`SGR_RESET`"
    unset values

    for x in $(seq 0 255) 0 ; do
        local ansi=`SGR $(BackgroundColor8 $x)`
        #echo -n -e "$ansi$x "
        #echo -n -e "`SGR $(BackgroundColor8 $x)`$x "
        local values="$values$ansi$x "
    done
    #echo -e `SGR_RESET`
    echo -e "$values`SGR_RESET`"
    unset values
}

Program
