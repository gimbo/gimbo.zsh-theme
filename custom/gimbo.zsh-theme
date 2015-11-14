# ------------------------------------------------------------------------
# Andy Gimblett's zsh theme
# Incorporating bits and bobs from various other themes:
#   bira - curvaceous lines
#   dstufft - virtualenv goodness
#   robbyrussell - git goodness
#   skaro - history line number
#   duellj - clock
# ------------------------------------------------------------------------

local clr_history=$fg[lightgrey]
local clr_time=$reset_color
local clr_host=$fg[red]
local clr_user=$fg[green]
local clr_path=$fg[white]
local clr_venv=$fg[cyan]
local clr_git_bg=$fg[lightgrey]
local clr_git_toplevel=$fg[green]
local clr_git_branch=$fg[yellow]
local clr_git_dirty=$fg_bold[yellow]
local clr_prompt=$reset_color
local clr_compact_host=$fg[lightgrey]

local history_line='%{$clr_history%}%h%{$reset_color%}'
local time='%{$clr_time%}%*%{$reset_color%}'
local user_host='%{$clr_user%}%n@%m%{$reset_color%}'
local current_dir='%{$clr_path%}${PWD/#$HOME/~}%{$reset_color%}'
local return_code="%(?..%{$fg[red]%}↵ %?%{$reset_color%})"

function virtualenv_info {
    # [ $VIRTUAL_ENV ] && echo '«'`basename $VIRTUAL_ENV`'» '
    [ $VIRTUAL_ENV ] && echo `basename $VIRTUAL_ENV`' '
}

function git_toplevel {
  x=`git rev-parse --show-toplevel 2> /dev/null`
  if [[ -n $x ]]; then
    echo `basename $x`
  fi
}

function compact_host {
  h=`hostname -s`
  if [[ $h == "shiva" ]]; then
    h=""
  elif [[ $h == "web317" ]]; then
    h="wf "
  elif [[ $h == "virabhadra" ]]; then
    # h="%{$clr_venv%}v%{$reset_color%} "
    h="v "
  elif [[ $h == "VTUMUKEDP017" ]]; then
    # h="%{$clr_venv%}v%{$reset_color%} "
    h="vd "
  else
    h="$h "
  fi
  echo "%{$clr_host%}$h%{$reset_color%}"
}

# Second line only appears if we're in a virtualenv or a git repository.
function extraLine {
  gitInfo=$(git_prompt_info)
  if [[ -n $gitInfo || -n $VIRTUAL_ENV ]]; then
    echo "
│ %{$clr_venv%}$(virtualenv_info)%{$reset_color%}%{$clr_git_toplevel%}$(git_toplevel)%{$reset_color%}$gitInfo"
  else
    echo -n ""
  fi
}

# # Second line only appears if we're in a virtualenv or a git repository.
# function extraLine {
#   gitInfo=$(git_prompt_info)
#   hgInfo=$(hg_prompt_info)
#   if [[ -n $gitInfo || -n $hgInfo || -n $VIRTUAL_ENV ]]; then
#     echo "
# │ %{$clr_venv%}$(virtualenv_info)%{$reset_color%}%{$clr_git_toplevel%}$(git_toplevel)%{$reset_color%}$gitInfo$hgInfo"
#   else
#     echo -n ""
#   fi
# }

PROMPT="
╭─${history_line} ${time} ${user_host}:${current_dir} ${return_code}\$(extraLine)
%{$clr_compact_host%}$(compact_host)%{$clr_prompt%}%B$%b%{$reset_color%} "

RPS1=""

ZSH_THEME_GIT_PROMPT_PREFIX="%{$clr_git_bg%}±(%{$clr_git_branch%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$clr_git_bg%}) %{$clr_git_dirty%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}%{$clr_git_bg%})"
