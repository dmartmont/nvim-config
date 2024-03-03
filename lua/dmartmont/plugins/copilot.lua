local Copilot = {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  opts = {
    filetypes = {
      markdown = false,
    },
    -- Disabled here so we correctly use cmp
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
}

return Copilot
