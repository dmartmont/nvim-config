local Pomodoro = {
  'dmartmont/pomodoro.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  dev = true,
  opts = {
    time_work = 1,
    time_break_short = 1,
    time_break_long = 1,
  },
  keys = {
    { '<leader>ps', '<cmd>PomodoroStart<cr>', desc = 'start' },
    { '<leader>px', '<cmd>PomodoroStop<cr>', desc = 'stop' },
  },
}

return Pomodoro
