function __new_alias_with_fallback
  set -f name $argv[1]
  set -f cmd $argv[2]
  set -f args1 $argv[3]
  set -f fallback $argv[4]
  set -f args2 $argv[5]

  function $name -V cmd -V args1 -V fallback -V args2
    if command -q $cmd
      command $cmd $args1 $argv
    else
      command $fallback $args2 $argv
    end
  end
end
