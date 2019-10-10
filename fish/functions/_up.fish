# Defined in /u/libe/.config/fish/functions/up.fish @ line 81
function _up
	set --local p (string trim --chars=/ (dirname $PWD) | string split /)

  for d in $p
    echo $d
  end
end
