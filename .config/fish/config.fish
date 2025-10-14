source $__fish_config_dir/env.fish
source $__fish_config_dir/util.fish

starship init fish | source

if test -e /home/linuxbrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

if status is-interactive
    # tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Darkest --show_time=No --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='One line' --prompt_spacing=Compact --icons='Many icons' --transient=No
 
    source $__fish_config_dir/greeting.fish

    # Sets

    # WIN32 C/C++ cross compilers
    set -g WIN32_CC x86_64-w64-mingw32-gcc
    set -g WIN32_CXX x86_64-w64-mingw32-g++

    set -g USR $USER


    source $__fish_config_dir/abbrevs.fish
    source $__fish_config_dir/aliases.fish
end
