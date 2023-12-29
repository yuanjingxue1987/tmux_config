# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
git-prompt
zsh-syntax-highlighting
zsh-autosuggestions
zsh-256color
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias vim='nvim'
alias python='python3'
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
POWERLINE_CONFIG_COMMAND=/Users/yuanjingxue/miniconda3/bin/powerline-config
POWERLINE_COMMAND=/Users/yuanjingxue/miniconda3/bin/powerline
.  /Users/yuanjingxue/miniconda3/lib/python3.11/site-packages/powerline/bindings/zsh/powerline.zsh
path=(
    /Users/yuanjingxue/miniconda3/bin,
    /use/local/bin,
    $path,
    #/home/linuxbrew/.linuxbrew/bin
)

# eval `dircolors /Users/yuanjingxue/configs/tmux_config/dircolors.256dark

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# StoryTell config
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yuanjingxue/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yuanjingxue/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yuanjingxue/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yuanjingxue/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuanjingxue/configs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuanjingxue/configs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuanjingxue/configs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuanjingxue/configs/google-cloud-sdk/completion.zsh.inc'; fi

alias os="open -a SourceTree"
alias og="open -a Github\ Desktop ."
function conda_activate {
    echo "Switching to $1"
    if [ "$1" = "storytell" ]; then
        cd ~/projects/$1 && conda activate ./env
    else
        cd ~/projects/$1/backend && conda activate ./env
    fi
}

alias ca=conda_activate
alias gr='git rebase'
alias gco='git checkout'
alias gp='git push'
alias gb='git branch'
alias finder='open -a finder'
alias tgs='tig status'
alias eb='vim ~/.zshrc'
alias sb='source ~/.zshrc'
alias server='ssh home'


# StoryTell Development
alias fls='gsutil ls'
alias fcp='gsutil cp'
alias fmv='gsutil mv'
alias st_ssh='/Users/jing/projects/storytell/tools/ssh.py'
alias mvim='open -a MacVim'


alias ct="date '+%Y-%m-%d %X %A' | pbcopy"
alias ssh_tasks='gcloud compute ssh storytell@storytell-scheduled-tasks --zone=us-west1-b'

function start_jupyter {
	PORT=8888
	export JUPYTER=./env/bin/jupyter
	export PYTHONPATH=~/projects:$PYTHONPATH
	export GOOGLE_APPLICATION_CREDENTIALS=~/gcloud_auth/432400780835-compute.json

	$JUPYTER serverextension enable --py jupyter_http_over_ws

	$JUPYTER notebook \
	  --NotebookApp.allow_origin='https://colab.research.google.com' \
	  --port=$PORT \
	  --NotebookApp.port_retries=0 \
	  --ip='0.0.0.0' \
	  --no-browser
}
