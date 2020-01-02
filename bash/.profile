# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function current_branch() { # Gets current branch
  git rev-parse --abbrev-ref HEAD
}
function gh_remote_path() { # Parses the 'remote path' of the repo: username/repo
  GH_PATH=`git remote -v | tr ':' ' ' | tr '.' ' ' | awk '/push/ {print $4}'`
  echo ${GH_PATH#com/}
}
function gh() { # Opens current branch on Github, works for all repos
  echo 'Opening branch on Github...'
  open "https://github.com/$(gh_remote_path)/tree/$(current_branch)"
}
function newpr() { # Opens current branch on Github in the "Open a pull request" compare view
  echo 'Opening compare on Github...'
  open "https://github.com/$(gh_remote_path)/compare/$(current_branch)?expand=1"
}
