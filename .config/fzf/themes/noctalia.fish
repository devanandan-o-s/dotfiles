set -l fzf_theme_opts "\
--color=bg+:#03131b
--color=bg:#000000
--color=spinner:#f2f2f3
--color=hl:#fd4663
--color=fg:#f2f2f3
--color=header:#fd4663
--color=info:#a2d1ef
--color=pointer:#f2f2f3
--color=marker:#afb3b6
--color=fg+:#f2f2f3
--color=prompt:#a2d1ef
--color=hl+:#fd4663
--color=selected-bg:#1c2c35
--color=border:#1c2c35
--color=label:#f2f2f3"

if set -q FZF_DEFAULT_OPTS[1]; and test -n "$FZF_DEFAULT_OPTS"
    set -Ux FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
$fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end
