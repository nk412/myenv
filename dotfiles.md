### .bashrc

#### Get git branch name quickly
    gitbranch(){
        local gitbranch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null )
        if [ $? -eq 0 ]; then
            if [ ! "$gitbranch_name" = "" ]; then
                local changes=""
                if [ $( git status --porcelain | wc -l ) -gt 0 ]; then changes="*" ; else changes=""; fi
                echo -e "\e[34;1m[${gitbranch_name}${changes}]\e[0m"
            fi
        fi
    }

#### Smiley face on last exit code
    smiley() {
        if [ $? -eq 0 ]; then
            echo -e "\e[1;32m :D\e[0m"
        else
            echo -e "\e[1;31m :(\e[0m"
        fi
    }
    
#### Initials
##### nagarjuna_kumarappan -> nk
    myinitials(){
        local last_command_exit=$?
        local myname="$( whoami | tr '_' ' ' )"
        local initials=""
        for names in $myname ; do
            initials="${initials}${names:0:1}"
        done
        echo $initials
        return $last_command_exit
    }
    
### 2-line Prompt
    ╭──╴ nk ─ localhost  :D  ~
    ╰──╴$ 

Note: Above functions need to be defined before updating PS1

    PS1="╭──╴ \e[33;1m\$(myinitials)\e[0m ─ \e[39;1m\h\e[0m \$(smiley) \$(gitbranch) \e[30;1m\w\e[0m\n╰──╴\$ "

