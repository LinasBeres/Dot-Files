###################################################
#################### PROMPT #######################
###################################################

function fish_prompt
    set last_status $status

    # rez env amount
    echo -n (set_color -o red)$REZ_ENV_PROMPT' '

    # username@hostname
    if [ (whoami) != "lberesna" ]
        echo -n (set_color -o grey)'|'(set_color -o yellow)(whoami)(set_color -o red)@(set_color -o yellow)(hostname -s)(set_color -o grey)'|'
    end

    # pwd
    echo -n ' '(set_color cyan)(prompt_pwd) ''
    set_color -o normal

    # my classic fish ">>>" prompt
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color blue)'❯ '

    set_color normal
end

function fish_right_prompt
    set -l last_status $status

    echo -n (set_color blue)'❮'(set_color yellow)'❮'(set_color red)'❮'
    set_color -o normal
    echo (fish_git_prompt)
end
