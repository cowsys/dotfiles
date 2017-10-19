function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c[ peco_change_directory # Bind for prco change directory to Ctrl+]
  bind \c] peco_select_ghq_repository
end

set -x GOPATH $HOME
set -x PATH $PATH /usr/local/bin $HOME/google-cloud-sdk/bin


balias g git

alias ll='ls -la'
alias gb='g branch'
alias gc='g checkout'
alias gs='g status'
alias gp='g pull'



function cd
  builtin cd $argv
  ls -la
end
