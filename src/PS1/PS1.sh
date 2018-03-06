# https://qiita.com/HMMNRST/items/d8fe7b3c528f447d68a6
# https://en.wikipedia.org/wiki/ANSI_escape_code

# Select Graphic Rendition
function SGR () {
    echo "\[\033[$1m\]"
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
venv_name=${target:+($target) }
#venv_name=${S_R}${target}
user_name="\u"
host_name="\h"
work_dir="\w"
chroot=`${debian_chroot:+($debian_chroot) }`

RESET=`SGR 00` # RESET, NORMAL, OFF
. ../echo/color_define.sh
COL_VENV=`SGR ${COLORS["BR"]}`
COL_CHROOT=`SGR ${COLORS["BY"]}`
COL_USERHOST=`SGR ${COLORS["BG"]}`
COL_DIR=`SGR ${COLORS["BB"]}`
# 多彩な色の設定方法↓
#COL_DIR=`SGR $(Array ${SGR_P["Bold"]} ${COLORS["B"]})` # 併用（PARAM + Color）
#. /tmp/work/Shell.Color.20180306130012/src/echo/color8_define.sh
#COL_DIR=`SGR $(Array 38 5 $(GetColor 5 2 1))` # 6bit color (R,G,Bは0..5の値)
#COL_DIR=`SGR $(Array 38 2 $(GetColor 255 255 255))` # 24bit color (R,G,Bは0..255の値)

PS1="${COL_VENV}${venv_name}${COL_CHROOT}${chroot}${COL_USERHOST}${user_name}@${host_name}${RESET}:${COL_DIR}${work_dir} \$${RESET} "

