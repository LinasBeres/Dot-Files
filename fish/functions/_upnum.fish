# Defined in /u/libe/.config/fish/functions/up.fish @ line 35
function _upnum
	if test -z $argv[1] -o -z $argv[2]
    return
  end

  set --local p $argv[1]
  set --local i $argv[2]

  while test $i -ne 0
    set p (dirname $p)
    set i (math $i - 1)
  end

  echo $p
end
