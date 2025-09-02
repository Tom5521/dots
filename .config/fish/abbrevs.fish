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
