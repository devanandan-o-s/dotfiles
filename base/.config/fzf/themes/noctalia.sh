fzf_theme_opts="\
--color=bg+:#4e3131
--color=bg:#000000
--color=spinner:#f8dcda
--color=hl:#ffb4ab
--color=fg:#f8dcda
--color=header:#ffb4ab
--color=info:#faacf9
--color=pointer:#f8dcda
--color=marker:#e6bdbb
--color=fg+:#f8dcda
--color=prompt:#faacf9
--color=hl+:#ffb4ab
--color=selected-bg:#5d3f3e
--color=border:#5d3f3e
--color=label:#f8dcda"

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:+$FZF_DEFAULT_OPTS
}$fzf_theme_opts"
