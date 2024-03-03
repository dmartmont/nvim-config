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

-- Quit
utils.lnnoremap('qa', 'quitall')
utils.lnnoremap('qq', 'quit')
utils.lnnoremap('qQ', 'quit!')

-- Files
utils.lnnoremap('fs', 'write')
