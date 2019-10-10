function fh
	set -l old (history | fzf --height 40% --reverse --inline-info --tac)

	if count $old > /dev/null
		eval $old
	end
end

