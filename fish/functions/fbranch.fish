function fbranch
	set -l branch (git branch --all | fzf --height 40%  --reverse --inline-info --tac | sed 's/^[0-9,.]* *//')

	if count $branch > /dev/null
		eval git checkout $branch
	end
end
