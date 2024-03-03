local M = {}

local function noremap(mode, key, cmd, opts)
  opts = opts or {}
  opts.noremap = true
  local to = '<cmd>' .. cmd .. '<cr>'

  if opts['local'] then
    opts.buffer = 0
  end

  vim.keymap.set(mode, key, to, opts)
end

local function nnoremap(key, to, opts)
  noremap('n', key, to, opts)
end

local function tnoremap(key, to, opts)
  noremap('t', key, to, opts)
end

local function inoremap(key, to, opts)
  noremap('i', key, to, opts)
end

local function lnnoremap(key, to, opts)
  -- Remap with <leader>
  nnoremap('<leader>' .. key, to, opts)
end

local function llnnoremap(key, to, opts)
  -- Remap with <localleader>
  nnoremap('<localleader>' .. key, to, opts)
end

local function setGlobalOption(key, value)
  -- "Sets a nvim global options"
  vim.opt[key] = value
end

M = {
  nnoremap = nnoremap,
  tnoremap = tnoremap,
  inoremap = inoremap,
  lnnoremap = lnnoremap,
  llnnoremap = llnnoremap,
  setGlobalOption = setGlobalOption,
}

return M
