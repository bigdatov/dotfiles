# color prompt
export TERM=xterm-256color

# colors have names too
# stolen from @tomnomnom who stole it from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;93m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;96m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# prompt colors
atC="${bldylw}"
nameC="${bldblu}"
hostC="${bldgrn}"
pathC="${txtcyn}"
gitC="${bldred}"
pyC="${bldylw}"
pointerC="${txtwht}"
normalC="${txtrst}"

# red pointer for root
if [ "${UID}" -eq "0" ]; then
    pointerC="${txtred}"
fi

gitBranch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

pythonVersion() {
    pyv="$(python -V 2>&1)"
    echo "${pyv:7:6}"
}

# custom PS1 that spells out @ sign (sorry!)
export PS1="${nameC}\u ${atC}at ${hostC}\h ${pyC}python \$(pythonVersion) ${gitC}\$(gitBranch)\n${pathC}\w ${pointerC}\$${normalC} "
