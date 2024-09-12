if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt -d
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red -o)"[$last_status]"(set_color normal)
    end
    echo -s (set_color green -o) "┌──(" (set_color blue -o) "$USER" (set_color normal -o) "@" (set_color blue -o) "$hostname" (set_color green) ")-[" (set_color white -o) (prompt_pwd --full-length-dirs 2) (set_color green) "]" (fish_git_prompt) " $stat"
    echo -s (set_color green) "└─" (set_color blue -o) '$ ' (set_color normal)
end

clear
cd /storage/emulated/0
neofetch
