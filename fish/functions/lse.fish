function lse
	set path ""
	set flags ""
	for option in $argv
		switch "$option"
			case "-*"
				set flag $flag $option
			case "*"
				set path $option
		end
	end
  eval $HOME/bin/ls_extended $PWD/$path $flag
end

