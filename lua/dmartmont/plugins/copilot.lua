local Copilot = {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    filetypes = {
      markdown = false,
    },
    -- Disabled here so we correctly use cmp
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  keys = {
    {
      '<leader>ccn',
      function()
        require('copilot.suggestion').next()
      end,
      desc = 'copilot generate next',
    },
    {
      '<leader>ccp',
      function()
        require('copilot.suggestion').prev()
      end,
      desc = 'copilot generate prev',
    },
  },
}

return Copilot
