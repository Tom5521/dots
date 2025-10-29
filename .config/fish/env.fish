if set -q TERMUX_VERSION
  set IS_TERMUX 1
end

if not set -q PREFIX
  set PREFIX /
end

# C/C++ compilers
#
# I LOVE clang!
set -gx CC clang
set -gx CXX clang++

set -gx EDITOR nvim

# Add ~/go/bin/ and ~/bin to the PATH
set -gx PATH  $PATH $HOME/go/bin $HOME/bin $HOME/.local/bin $HOME/.cargo/bin /sbin/
set -gx XDG_DATA_DIRS $HOME/.local/share/ $XDG_DATA_DIRS


alias which "command -v" # Why the fuck which is deprecated?!?!?!

set -l gh_key_path $__fish_config_dir/secrets/gh-key.txt 
if test (whoami) != "root";and test -e $gh_key_path
    set -x GH_TOKEN (cat $gh_key_path)
end
