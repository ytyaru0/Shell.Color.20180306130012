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

# https://qiita.com/sayama0402/items/6385b9019f37031eb2b9
COLORS=(
    ["BLACK"]="30"
    ["R"]="31"
    ["G"]="32"
    ["Y"]="33"
    ["B"]="34"
    ["M"]="35"
    ["C"]="36"
    ["W"]="37"
    ["BBLACK"]="01;30"
    ["BR"]="01;31"
    ["BG"]="01;32"
    ["BY"]="01;33"
    ["BB"]="01;34"
    ["BM"]="01;35"
    ["BC"]="01;36"
    ["BW"]="01;37"
)
# ${COLORS["R"]}

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

function Program () {
    for x in `GetStandardColors` ; do
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
#__CO__

function Program () {
    . ../ansi.sh
    . ../SGR_P.sh
    . ../color_define.sh

    echo "----- 連想配列指定 -----"
    for key in ${!COLORS[@]};
    do
        local ansi=`SGR ${COLORS[$key]}`
        #echo -n -e "$ansi${COLORS[$key]} "
        local values="$values$ansi${COLORS[$key]} "
    done
    echo -e "$values`SGR_RESET`"
    #echo -e -n `SGR_RESET`
    unset values

    for key in ${!COLORS[@]};
    do
        local ansi=`SGR $(SGR_P ${SGR_P['Bold']} ${COLORS[$key]})`
        #echo -n -e "$ansi${COLORS[$key]} "
        local values="$values$ansi${COLORS[$key]} "
    done
    echo -e "$values`SGR_RESET`"
    #echo -e `SGR_RESET`
    unset values

    for key in ${!BG_COLORS[@]};
    do
        local ansi=`SGR ${BG_COLORS[$key]}`
        #echo -n -e "$ansi${BG_COLORS[$key]} "
        local values="$values$ansi${BG_COLORS[$key]} "
    done
    echo -e "$values`SGR_RESET`"
    #echo -e `SGR_RESET`
    unset values

    echo "----- マジックナンバー指定 -----"
    for x in $(seq 30 37) $(seq 90 97) ; do
        local ansi=`SGR $x`
        echo -n -e "$ansi$x "
        local values="$values$ansi$x "
    done
    echo -e "$values`SGR_RESET`"
    #echo -e `SGR 0`
    unset values

    for x in $(seq 30 37) $(seq 90 97) ; do
        local ansi=`SGR $(SGR_P 01 $x)`
        #echo -n -e "$ansi$x "
        local values="$values$ansi$x "
    done
    echo -e "$values`SGR_RESET`"
    #echo -e `SGR 0`
    unset values

    for x in  $(seq 40 47) $(seq 100 107) ; do
        local ansi=`SGR $x`
        #echo -n -e "$ansi$x "
        local values="$values$ansi$x "
    done
    echo -e "$values`SGR_RESET`"
    #echo -e `SGR 0`
    unset values
}

Program
