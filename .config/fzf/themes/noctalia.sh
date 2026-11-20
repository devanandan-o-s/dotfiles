fzf_theme_opts="\
--color=bg+:#263c44
--color=bg:#000000
--color=spinner:#d8e4ea
--color=hl:#ffb4ab
--color=fg:#d8e4ea
--color=header:#ffb4ab
--color=info:#62dbb6
--color=pointer:#d8e4ea
--color=marker:#b3cad4
--color=fg+:#d8e4ea
--color=prompt:#62dbb6
--color=hl+:#ffb4ab
--color=selected-bg:#344a52
--color=border:#344a52
--color=label:#d8e4ea"

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:+$FZF_DEFAULT_OPTS
}$fzf_theme_opts"
