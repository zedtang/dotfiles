export EDITOR='nvim'
export VISUAL='nvim'
export BAT_PAGER="less -RF"

export GOPATH=$HOME/go
for pp in \
    /usr/local/go/bin \
    $GOPATH/bin \
    ; do
    PATH=$pp:${PATH}
done
export PATH
export SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk
export GTAGSLABEL=native-pygments
export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export HOMEBREW_NO_AUTO_UPDATE=1
export PYTHON_HOST_PROG=`which python`
export PYTHON3_HOST_PROG=`which python3`

alias t='tmux attach || tmux new-session'
alias vim='nvim'

# Gets current branch
current_branch() {
    git rev-parse --abbrev-ref HEAD
}

# Parses the 'remote path' of the repo: username/repo
gh_remote_path() {
    GH_PATH=`git remote -v | tr ':' ' ' | tr '.' ' ' | awk '/push/ {print $4}'`
    echo ${GH_PATH#com/}
}

# Opens current branch on Github, works for all repos
gh() {
    echo 'Opening branch on Github...'
    open "https://github.com/$(gh_remote_path)/tree/$(current_branch)"
}

# Opens current branch on Github in the "Open a pull request" compare view
newpr() {
    echo 'Opening compare on Github...'
    open "https://github.com/$(gh_remote_path)/compare/$(current_branch)?expand=1"
}
