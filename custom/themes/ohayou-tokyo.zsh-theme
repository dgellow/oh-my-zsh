# File: ohayou-tokyo.zsh-theme
# Creation Date: 2013
# Author: Samuel El-Borai <sam@elborai.me>
# Description: A theme for zsh
#
# Work based on wedisagree theme by transat https://github.com/transat

# Here are the colours from Textmate's Monokai theme if you want to modify your terminal colour scheme:
#
# Black: 0, 0, 0
# Red: 229, 34, 34
# Green: 166, 227, 45
# Yellow: 252, 149, 30
# Blue: 196, 141, 255
# Magenta: 250, 37, 115
# Cyan: 103, 217, 240
# White: 242, 242, 242

# LEFT PROMPT
PROMPT='%{$fg[black]%}%B%-1~%{$reset_color%} | %F{164}%1d%b%{$reset_color%} ▷ '

# RIGHT PROMPT
RPROMPT='%F{243}$(pulumi_prompt_info)%{$reset_color%}%F{164}%B$(git_prompt_info)%b%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}$(git_prompt_status)%{$reset_color%} ${time}'

# LOCAL TIME, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

# GIT
ZSH_THEME_GIT_PROMPT_PREFIX="  %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✱"   # Ⓓ ☂
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} 〒" # ⓣ
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}  "    # Ⓞ

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✚"       # ⓐ ⑃
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ⑃"  # ⓜ ⑁
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"      # ⓧ ⑂
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➜"     # ⓡ ⑄
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ⬇" # ⓤ ⑊

# More symbols to choose from:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ
