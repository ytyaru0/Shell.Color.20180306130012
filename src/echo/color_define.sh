# https://en.wikipedia.org/wiki/ANSI_escape_code
# https://qiita.com/sayama0402/items/6385b9019f37031eb2b9
declare -A COLORS;
COLORS=(
    ["BLACK"]="30"
    ["R"]="31"
    ["G"]="32"
    ["Y"]="33"
    ["B"]="34"
    ["M"]="35"
    ["C"]="36"
    ["W"]="37"
    ["BBLACK"]="90"
    ["BR"]="91"
    ["BG"]="92"
    ["BY"]="93"
    ["BB"]="94"
    ["BM"]="95"
    ["BC"]="96"
    ["BW"]="97"
    ["SBLACK"]="01;30"
    ["SR"]="01;31"
    ["SG"]="01;32"
    ["SY"]="01;33"
    ["SB"]="01;34"
    ["SM"]="01;35"
    ["SC"]="01;36"
    ["SW"]="01;37"
    ["SBBLACK"]="01;90"
    ["SBR"]="01;91"
    ["SBG"]="01;92"
    ["SBY"]="01;93"
    ["SBB"]="01;94"
    ["SBM"]="01;95"
    ["SBC"]="01;96"
    ["SBW"]="01;97"
)
# ${COLORS["R"]}

declare -A SGR_P;
SGR_P=(
    ["Reset"]="0"
    ["Bold"]="1"
    ["Underline"]="4"
    ["Reverse"]="7"
)
# ${SGR_P["Bold"]}

