function fn
	set -l file (fzf --height 40% --reverse --inline-info --tac)

	if count $file > /dev/null
		eval nvim $file
	end
end
