# Defined in /u/libe/.config/fish/functions/up.fish @ line 13
function _updir
	if test $argv[1] = '/' -o -z $argv[1] -o -z $argv[2]
    return
  end

  set --local p (dirname "$argv[1]")
  set --local a (basename "$p")
  set --local b (basename "$argv[2]")

  if test -z $a -o -z $b
    return
  end

  if string match -iq "$b*" $a
    echo $p
    return
  end

  _updir $p $argv[2]
  # Ooo, look at this clever recursion!
end
