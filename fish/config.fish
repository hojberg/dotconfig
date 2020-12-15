# status --is-interactive; and source (rbenv init -|psub)

set -x EDITOR nvim
set -x DATABASE_URL postgres:///talentbird

set -x ANDROID_HOME {$HOME}/Library/Android/sdk
set -x PATH $PATH {$ANDROID_HOME}/tools
set -x PATH {$PATH} ~/.local/bin
set -x PATH {$PATH} {$ANDROID_HOME}/platform-tools
set -x FZF_DEFAULT_COMMAND "rg --files"
set fish_greeting ""

alias l "ls -las"
alias t "tmux"
alias vim "nvim"
alias v "nvim"
alias vv "nvim ."
alias be "bundle exec"

# content has to be in .config/fish/config.fish
# if it does not exist, create the file
setenv SSH_ENV $HOME/.ssh/environment

function start_agent                                                                                                                                                                    
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ] 
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end  
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end  
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else 
        start_agent
    end  
end

starship init fish | source

echo -e "\nsource "(brew --prefix asdf)"/asdf.fish" >> ~/.config/fish/config.fish
