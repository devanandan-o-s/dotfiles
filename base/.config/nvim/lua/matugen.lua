 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#1d100f',
    base02 = '#281a19',
    base03 = '#ad8886',
    base04 = '#e6bdbb',
    base05 = '#f8dcda',
    base06 = '#f8dcda',
    base07 = '#f8dcda',
    base08 = '#ffb4ab',
    base09 = '#ffb3b0',
    base0A = '#edb4eb',
    base0B = '#faacf9',
    base0C = '#ffb3b0',
    base0D = '#faacf9',
    base0E = '#edb4eb',
    base0F = '#ffd6fb',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f8dcda',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#ad8886',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#f8dcda',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#ad8886',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#faacf9',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#e6bdbb',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#faacf9' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#edb4eb' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#ffb3b0' })
  hi('TelescopeSelection',      { fg = '#f8dcda',          bg = '#281a19' })
  hi('TelescopeSelectionCaret', { fg = '#faacf9',             bg = '#281a19' })
  hi('TelescopeMatching',       { fg = '#faacf9',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f8dcda',          bg = '#000000' })
  hi('MiniPickBorder',         { fg = '#ad8886',             bg = '#000000' })
  hi('MiniPickPrompt',   { fg = '#f8dcda',          bg = '#000000' })
  hi('MiniPickPromptPrefix',   { fg = '#faacf9',             bg = '#000000' })
  hi('MiniPickBorderText',    { fg = '#000000',             bg = '#faacf9' })
  hi('MiniPickMatchCurrent',      { fg = '#f8dcda',          bg = '#281a19' })
  hi('MiniPickPromptCaret', { fg = '#faacf9',             bg = '#281a19' })
  hi('MiniPickMatchRanges',       { fg = '#faacf9',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
