function __new_alias_with_fallback
  set -f name $argv[1]
  set -f cmd (string split " " $argv[2])
  set -f fallback (string split " " $argv[3])

  function $name -V cmd -V fallback
    if command -q $cmd[1]
      command $cmd[1] $cmd[2..] $argv
    else
      command $fallback[1] $fallback[2..] $argv
    end
  end
end
