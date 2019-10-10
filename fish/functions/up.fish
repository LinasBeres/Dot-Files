# Defined in /u/libe/.config/fish/functions/up.fish @ line 51
function up
	
  if not count $argv > /dev/null
    cd ..
    return
  end

  # go back
  if test $argv[1] = '-' -o -d $argv[1]
    cd $argv[1]
    return
  end

  # check for num
  set --local regex '^[0-9]+$'

  if string match -rq $regex $argv[1]
    set d (_upnum $PWD $argv[1])
  else
    set d (_updir $PWD $argv[1])
  end

  if test -d $d
    cd $d
    return
  end

  echo -e "usage: up [dir|num|-]\npwd: $PWD"
end
