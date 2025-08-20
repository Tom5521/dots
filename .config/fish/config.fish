source $__fish_config_dir/check-termux.fish
source $__fish_config_dir/env.fish
source $__fish_config_dir/util.fish

if status is-interactive
    if not set -q SKIP_GREETING
        set SKIP_GREETING 0 # 1 to disable usr and root grettings
    end
    # Functions. 
    function fish_greeting
        if test $SKIP_GREETING -eq 1
            return
        end
        set -l cows ~/.config/fish
        # In this case, this files **MUST** be in /root/.config/fish directory, for security reasons
        if test (whoami) = "root"
            cowsay -e "0" -f "$cows/shark.cow" "What are we breaking today, boss?" \
            | lolcat -a -d 1
        else
            cowsay -e "^" -f "$cows/fish.cow" "Welcome to fish shell, $(whoami)!" \
            | lolcat
        end
        echo
    end
    function see-starwars
        telnet towel.blinkenlights.nl $argv
    end


    # Sets

    # WIN32 C/C++ cross compilers
    set -g WIN32_CC x86_64-w64-mingw32-gcc
    set -g WIN32_CXX x86_64-w64-mingw32-g++

    set -g USR $USER

    function mv
        command -v advmv > /dev/null
        if test $status -eq 0
            advmv -g $argv
        else
            $PREFIX/bin/mv $argv
        end
    end

    function cp
        command -v advcp > /dev/null
        if test $status -eq 0
            advcp -g $argv
        else
            $PREFIX/bin/cp $argv
        end
    end


    function eza
        command -v eza > /dev/null
        if test $status -eq 0
            command eza --icons $argv
        else
            $PREFIX/bin/ls $argv
        end
    end

    # Abbreviations
    abbr --add mkd mkdir
    abbr --add inst yay -S
    abbr --add rem yay -R
    abbr --add rmf rm -rf
    abbr --add autoinst yay --noconfirm -S
    abbr --add autorem yay --noconfirm -R
    abbr --add hyprcfg cd ~/.config/hypr/
    abbr --add i3cfg cd ~/.config/i3/
    abbr --add spacman sudo pacman
    abbr --add fishcfg cd ~/.config/fish/
    abbr --add s sudo
    abbr --add umount sudo umount
    abbr --add mount sudo mount
    abbr --add fdisk sudo fdisk
    abbr --add cdp cd (pwd -P)

    if not test (whoami) = "root"
        abbr --add docker sudo docker
    end

    # Aliases
    ## Until they fix the compilation with clang, this will always be g++
    alias hyprpm "CXX=g++ $PREFIX/bin/hyprpm"
    alias ls eza
    alias cls clear
    alias la "eza -la"
    alias dir "ls --color"
    alias ddir dir
    alias please sudo
    alias poweroff "systemctl poweroff"
    alias walk "walk --icons"
    alias claer sl
    alias fdisk "sudo fdisk"
    alias neofetch hyfetch
    alias gzip pigz
    alias ncdu gdu
    alias nextonic "tectonic -X"
    

    if test (whoami) = "root"
        alias rm "rm -i"
    end
end
