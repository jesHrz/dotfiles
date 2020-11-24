if [ $UID -eq 0 ]; then CARETCOLOR="red"; QUAD="#"; else CARETCOLOR="blue"; QUAD="$"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{${fg[green]}%}%3~$(git_prompt_info)%{${fg[white]}%}$%{${reset_color}%} '

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
