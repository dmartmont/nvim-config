local utils = require('dmartmont.utils')
-- Reload configuration
utils.lnnoremap('rr', 'source $MYVIMRC')

utils.lnnoremap('sl', 'Lazy')

---- Windows
-- Move cursor between windows
utils.nnoremap('<C-h>', 'wincmd h')
utils.nnoremap('<C-j>', 'wincmd j')
utils.nnoremap('<C-k>', 'wincmd k')
utils.nnoremap('<C-l>', 'wincmd l')

-- Buffers
-- Toggle between current and last active buffer
utils.lnnoremap('<tab>', 'b#')
utils.lnnoremap('bd', 'bdelete')
utils.lnnoremap('bn', 'bnext')
utils.lnnoremap('bp', 'bprevious')

-- Tabs
utils.lnnoremap('tc', 'tabnew')
utils.lnnoremap('tn', 'tabnext')
utils.lnnoremap('tp', 'tabprevious')

-- Quit
utils.lnnoremap('qa', 'quitall')
utils.lnnoremap('qq', 'quit')
utils.lnnoremap('qQ', 'quit!')

-- Files
utils.lnnoremap('fs', 'write')

-- Editor
---- Enable spelling
vim.keymap.set('n', '<leader>es', function()
  vim.opt_local['spell'] = vim.opt_local['spell'] == nil and true or not vim.opt_local['spell']
  vim.print(vim.opt_local['spell'])
end)

-- Yanking to system clipboard
vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y')
