# Andy Gimblett's zsh prompt/theme.
#
# https://github.com/gimbo/gimbo.zsh-theme
#
# This is a modification/extension of the purepower config for the
# powerlevel10k theme; everything in this file between this comment
# block and the word GIMBO is just the default purepower config. My
# modifications are after that (i.e. after the GIMBO comment).
#
# It's fairly minimal in terms of eye candy, focusing on showing the
# interesting data, with a smattering of colour to highlight important
# parts.
#
# Here's an example of how this theme looks; see the git repo for see
# more examples, with colours and annotation.
#
# ╭─10015 11:53:56 gimbo@shaman ~/prog/gimbo/zsh-plugins/gimbo.zsh-theme
# │ gimbo.zsh-theme±master                                             5.59
# $
#
# We have:
#
# * First line:
#   - History number
#   - Time
#   - Context (i.e. username/hostname)
#   - Directory writable status (not shown above)
#   - Directory - in full
#   - Status of last command if it failed (not shown above)
#   - pyenv in use if not standard (not shown above)
#
# * Second line - only shown if either of the following are present:
#  - Python virtualenv name (not shown above)
#  - Git info, consisting of:
#    + Repo name (i.e. name of folder containing .git folder)
#    + (A fixed ± separator)
#    + Branch name
#    + Dirtiness indicators (not shown above)
#
# * Right hand side:
#  - Command execution time
#  - Indicator if user is root (not shown above)
#  - Background jobs indicator (not shown above)
#
# * Actual prompt line:
#  - Just a $ except if in vicmd mode (then it's a <)
#  - Green if last command succeeded; red otherwise.
#
# End of introduction; everything between here and the word GIMBO is standard purepower.


# Original location: https://github.com/romkatv/dotfiles-public/blob/master/.purepower.
# If you copy this file, keep the link to the original and this sentence intact; you are encouraged
# to change everything else.
#
# This file defines configuration options for Powerlevel10k ZSH theme that will make your prompt
# lightweight and sleek, unlike the default bulky look. You can also use it with Powerlevel9k -- a
# great choice if you need an excuse to have a cup of coffee after every command you type.
#
# This is how it'll look:
# https://raw.githubusercontent.com/romkatv/dotfiles-public/master/dotfiles/purepower.png.
#
# Pure Power needs to be installed in addition to Powerlevel10k, not instead of it. Pure Power
# defines a set of configuration parameters that affect the styling of Powerlevel10k; there is no
# code in it.
#
#                         PHILOSOPHY
#
# This configuration is made for those who care about style and value clear UI without redundancy
# and tacky ornaments that serve no function.
#
#   * No overwhelming background that steals attention from real content on your screen.
#   * No redundant icons. A clock icon next to the current time takes space without conveying any
#     information. This is your personal prompt -- you don't need an icon to remind you that the
#     segment on the right shows current time.
#   * No separators between prompt segments. Different foreground colors are enough to keep them
#     visually distinct.
#   * Bright colors for important things, low-contrast colors for everything else.
#   * No needless color switching. The number of stashes you have in a git repository is always
#     green. Since its meaning is the same in a clean and in a dirty repository, it doesn't change
#     color.
#
#                         LEFT PROMPT
#
#   * Your current directory is bright blue when under $HOME and brownish everywhere else.
#   * A lock icon is shown on the far left if you cannot write to the current directory.
#   * The prompt symbol on the left is '❮' when vicmd keymap is active and '❯' otherwise. It's green
#     if the last command has succeeded and red if it has failed.
#   * Git prompt colors:
#     * Grey: prompt is refreshing in the background (happens only in large repositories).
#     * Green: clean (no stated or unstaged changes and no untracked files).
#     * Yellow: dirty (some stated or unstaged changes).
#     * Teal: some untracked files but otherwise clean (no staged or unstaged changes).
#   * Git prompt icons:
#     * '@12345678' (git prompt color): detached HEAD at commit 12345678.
#     * 'my-feature' (git prompt color): on branch my-feature.
#     * 'my-feature|master' (git prompt color): on branch my-feature tracking remote branch master.
#     * '#my-release' (git prompt color): on tag my-release.
#     * '+' (yellow): staged changes.
#     * '!' (yellow): unstaged changes.
#     * '?' (teal): untracked files.
#     * '⇡42' (green): 42 commits ahead of remote.
#     * '⇣42' (green): 42 commits behind remote.
#     * '*42' (green): 42 stashes.
#
#                        RIGHT PROMPT
#
#   * Current time on the far right.
#   * Last command execution time (in seconds).
#   * Error code with an optional signal name of the last command if it failed, in red.
#   * A gear icon if you have background jobs.
#   * An unlocked lock icon if you are root.
#   * If you type `custom_rprompt() { echo 'message' }`, you'll get 'message' shown on the right.
#     Useful to integrate with your scripts that change some sort of state/environment.
#
#                       INSTALLATION
#
# 1. Copy this file to your home directory.
#
#    ( cd && curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower )
#
# 2. Source the file from ~/.zshrc.
#
#    echo 'source ~/.purepower' >>! ~/.zshrc
#
# 3. Enable Powerlevel10k ZSH theme. The easiest way is this:
#
#    git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
#
# If you are using a plugin manager, see https://github.com/romkatv/powerlevel10k for installation
# options.
#
#                       CONFIGURATION
#
# You can set PURE_POWER_MODE before sourcing ~/.purepower to restrict the range of characters it
# uses.
#
#   * PURE_POWER_MODE=fancy     use unicode characters in the prompt (default)
#   * PURE_POWER_MODE=portable  use only ascii characters in the prompt
#
# You can switch mode on the fly by setting PURE_POWER_MODE and executing zsh. Useful when you end
# up in an environment without a capable font and see gibberish on your screen.
#
#   PURE_POWER_MODE=portable exec zsh  # switch to portable mode
#   PURE_POWER_MODE=fancy    exec zsh  # switch to fancy mode
#
# To configure what gets shown in the prompt, edit ~/.purepower. See
# https://github.com/romkatv/powerlevel10k/blob/master/README.md#installation-and-configuration for
# configuration options. Prompt configuration is a deeply personal affair, so take your time to
# craft the right prompt just for you. The stock configuration is merely a starting point, a source
# of inspiration, a frame for your own creation. Mercilessly slash everything of little value to
# you. Don't care how long commands take to execute? Get rid of command_execution_time segment!
# Boldly mold prompt pieces useful to you to ensure a perfect fit to your workflow and aesthetic
# preferences. Take full advantage of powerlevel over 9k!
#
# Remember that colors looks differently in different terminals. Use this script to choose what
# works best for you.
#
#   for ((i = 0; i != 256; ++i)); do print -P "%F{${(l:3::0:)i}}${(l:3::0:)i} TEST%f"; done
#
# Keep in mind that some prompt segments can appear and disappear depending on the state of your
# environment. Make sure colors work well in every situation. Neighboring segments should always
# have distinct colors.
#
# If you are using Pure Power with Powerlevel9k rather than Powerlevel10k, you'll need to set
# PURE_POWER_USE_P10K_EXTENSIONS=0 before sourcing ~/.purepower or you'll see gibberish in your left
# prompt. This option will turn off vi keymap integration, so your prompt symbol will always be '❯'.
# Your prompt will also be 10-100 times slower with Powerlevel9k. This is not the fault of Pure
# Power. Powerlevel9k is slow with any styling.
#
#                       ATTRIBUTION
#
# Visual design of this configuration borrows heavily from https://github.com/sindresorhus/pure.
# Recretion of Pure look and feel in Powerlevel10k was inspired by
# https://github.com/iboyperson/p9k-theme-pastel.

if test -z "${ZSH_VERSION}"; then
  echo "purepower: unsupported shell; try zsh instead" >&2
  return 1
  exit 1
fi

() {
  emulate -L zsh && setopt no_unset pipe_fail

  if (( ARGC )); then
    echo -E "Usage: source ~/.purepower" >&2
    return 1
  fi

  local mode=${PURE_POWER_MODE:-fancy}
  case $mode in
    fancy)
      local vi_insert=$'\u276F'
      local vi_cmd=$'\u276E'
      local lock=$'\uF023'
      local incoming=$'\u21E3'
      local outgoing=$'\u21E1'
      local root=$'\uF09C'
      local jobs=$'\uF013'
      ;;
    *)
      if [[ $mode != portable ]]; then
        echo -En "purepower: invalid mode: ${(qq)mode}; " >&2
        echo -E  "valid options are 'fancy' and 'portable'; falling back to 'portable'" >&2
      fi
      local vi_insert='>'
      local vi_cmd='<'
      local lock='X'
      local incoming='<'
      local outgoing='>'
      local root='#'
      local jobs='%%'
      ;;
  esac

  typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      dir_writable dir vcs)

  typeset -ga POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      status command_execution_time root_indicator background_jobs custom_rprompt time)

  if (( ${PURE_POWER_USE_P10K_EXTENSIONS:-1} )); then
    local p="\${\${\${KEYMAP:-0}:#vicmd}:+${${vi_insert//\\/\\\\}//\}/\\\}}}"
    p+="\${\${\$((!\${#\${KEYMAP:-0}:#vicmd})):#0}:+${${vi_cmd//\\/\\\\}//\}/\\\}}}"
  else
    p=$vi_insert
  fi

  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?.%F{002}${p}%f.%F{009}${p}%f) "
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$'\n'
  typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_WHITESPACE_BETWEEN_{LEFT,RIGHT}_SEGMENTS=

  typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=none
  typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_VISUAL_IDENTIFIER_COLOR=003
  typeset -g POWERLEVEL9K_LOCK_ICON=$lock

  typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT}_BACKGROUND=none
  typeset -g POWERLEVEL9K_DIR_{ETC,DEFAULT}_FOREGROUND=209
  typeset -g POWERLEVEL9K_DIR_{HOME,HOME_SUBFOLDER}_FOREGROUND=039
  typeset -g POWERLEVEL9K_{ETC,FOLDER,HOME,HOME_SUB}_ICON=

  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED,LOADING}_BACKGROUND=none
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=076
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=014
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=011
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=244
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNTRACKEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNSTAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_INCOMING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_OUTGOING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STASHFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_ACTIONFORMAT_FOREGROUND=001
  typeset -g POWERLEVEL9K_VCS_LOADING_ACTIONFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_LOADING_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{GIT,GIT_GITHUB,GIT_BITBUCKET,GIT_GITLAB,BRANCH}_ICON=
  typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=$'\b|'
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\b?'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\b!'
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON=$'\b+'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$incoming
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$outgoing
  typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
  typeset -g POWERLEVEL9K_VCS_TAG_ICON=$'\b#'

  typeset -g POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=none
  typeset -g POWERLEVEL9K_ROOT_ICON=$root

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=none
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_COLOR=002
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_ICON=$jobs

  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=none
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
  typeset -g POWERLEVEL9K_EXECUTION_TIME_ICON=

  typeset -g POWERLEVEL9K_TIME_BACKGROUND=none
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=244
  typeset -g POWERLEVEL9K_TIME_ICON=

  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=none
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=009
  typeset -g POWERLEVEL9K_CARRIAGE_RETURN_ICON=

  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT=custom_rprompt
  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT_BACKGROUND=none
  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT_FOREGROUND=012

  function custom_rprompt() {}  # redefine this to show stuff in custom_rprompt segment



  # GIMBO

  # Helpers

  function get_vcs_root() {
      # Could maybe speed this up (particularly as it's called twice)
      # by using the gitstatus daemon thing like the vcs element
      # does. It's probably not worth the bother though.
      #
      # If interested, see: https://github.com/romkatv/gitstatus
      local root
      local x=$(git rev-parse --show-toplevel 2> /dev/null)
      if [[ -n $x ]]; then
          root=${x:t}
          echo "$root"
      fi
  }

  # Custom prompt segments

  # We don't want to display the second line if there's nothing to
  # display there (i.e. no virtualenv and no git); this custom segment
  # gives us that.
  #
  function maybe_newline() {
      if [[ -n "$VIRTUAL_ENV" || -n $(get_vcs_root) ]]; then
          echo "\n│"
      fi
  }
  typeset -g POWERLEVEL9K_CUSTOM_MAYBE_NEWLINE="maybe_newline"

  # Display the git root directory, i.e. the name of the directory
  # (this or an ancestor) containing the .git folder.
  #
  function vcs_root() {
      local root=$(get_vcs_root)
      if [[ -n $root ]]; then
          echo "$root±"
      fi
  }
  typeset -g POWERLEVEL9K_CUSTOM_VCS_ROOT="vcs_root"

  # General config
  #
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      history
      time
      context
      dir_writable dir
      status
      pyenv
      custom_maybe_newline
      virtualenv
      custom_vcs_root vcs_joined
  )
  typeset -ga POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      command_execution_time
      root_indicator
      background_jobs
  )

  # Config for first line elements
  #
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭─"
  typeset -g POWERLEVEL9K_HISTORY_BACKGROUND=none
  typeset -g POWERLEVEL9K_HISTORY_FOREGROUND=none
  typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
  typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=none
  typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=none
  typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND=229
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=229
  typeset -g POWERLEVEL9K_DIR_ETC_FOREGROUND=196
  typeset -g POWERLEVEL9K_PYTHON_ICON=''
  typeset -g POWERLEVEL9K_PYENV_BACKGROUND=none
  typeset -g POWERLEVEL9K_PYENV_FOREGROUND=005

  # Config for second line elements
  #
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="│ "
  typeset -g POWERLEVEL9K_CUSTOM_MAYBE_NEWLINE_BACKGROUND=none
  typeset -g POWERLEVEL9K_CUSTOM_MAYBE_NEWLINE_FOREGROUND=none
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=none
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=015
  typeset -g POWERLEVEL9K_CUSTOM_VCS_ROOT_BACKGROUND=none
  typeset -g POWERLEVEL9K_CUSTOM_VCS_ROOT_FOREGROUND=245

  # Config for final/prompt line
  #
  local vi_insert='$'
  if (( ${PURE_POWER_USE_P10K_EXTENSIONS:-1} )); then
    local p="\${\${\${KEYMAP:-0}:#vicmd}:+${${vi_insert//\\/\\\\}//\}/\\\}}}"
    p+="\${\${\$((!\${#\${KEYMAP:-0}:#vicmd})):#0}:+${${vi_cmd//\\/\\\\}//\}/\\\}}}"
  else
    p=$vi_insert
  fi
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?.%F{002}${p}%f.%F{009}${p}%f) "

} "$@"
