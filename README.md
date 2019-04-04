# gimbo's zsh prompt theme

> A zsh theme with lots of features, little eye candy, and a magic
> context-sensitive extra line

This is my zsh prompt, a modification/extension of the
[purepower](https://github.com/romkatv/dotfiles-public/blob/master/.purepower)
config for the
[powerlevel10k](https://github.com/romkatv/powerlevel10k) theme.

It's fairly minimal in terms of eye candy, focusing on showing the
interesting data, with a smattering of colour (suitable for a dark
background) to highlight important parts.

The main feature of note is probably the second line, which only
appears in the presence of a python venv or git repo.

## Structure

This is a two- or three-line prompt, depending on context.  We have:

* First line:
    - History number
    - Time
    - Context (i.e. username/hostname)
    - Directory writable status
    - Directory - in full
    - Status of last command if it failed
    - pyenv in use if not standard

* Second line - only shown if either of the following are present:
   - Python virtualenv name
   - Git info, consisting of:
     + Repo name (i.e. name of folder containing `.git` folder)
     + (A fixed `±` separator)
     + Branch name
     + Dirtiness indicators

* Actual prompt line:
   - Just a `$` except if in vicmd mode (then it's a `<`)
   - Green if last command succeeded; red otherwise.

* Right hand side:
   - Command execution time
   - Indicator if user is root
   - Background jobs indicator


## Screenshots

![gimbo theme screenshot](https://raw.githubusercontent.com/gimbo/gimbo.zsh-theme/master/screenshots/gimbo-theme%20screenshot.png)

Same examples, With annotations:

![gimbo theme screenshot with annotations](https://raw.githubusercontent.com/gimbo/gimbo.zsh-theme/master/screenshots/gimbo-theme%20screenshot%20with%20annotations.png)
