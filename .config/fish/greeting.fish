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
