
alias see-starwars "telnet towel.blinkenlights.nl"

__new_alias_with_fallback ncdu gdu ncdu
__new_alias_with_fallback neofetch hyfetch neofetch
__new_alias_with_fallback mv "advmv -g" mv
__new_alias_with_fallback cp "advcp -g" cp
__new_alias_with_fallback ls "eza --icons" "ls -a"

# Aliases
## Until they fix the compilation with clang, this will always be g++
alias hyprpm "CXX=g++ $(which hyprpm)"
alias cls clear
alias dir "$(which ls) --color"
alias ddir dir
alias please sudo
alias poweroff "systemctl poweroff"
alias walk "walk --icons"
alias claer sl
alias gzip pigz
alias nextonic "tectonic -X"

if test (whoami) = "root"
    alias rm "rm -i"
end
