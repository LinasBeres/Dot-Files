function fd
	if count $argv > /dev/null
		set dir (z -l $argv | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac | sed 's/^[0-9,.]* *//')
	else
		set dir (z -l $PWD | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac | sed 's/^[0-9,.]* *//')
	end

	if count $dir > /dev/null
		eval cd $dir
	end
end
