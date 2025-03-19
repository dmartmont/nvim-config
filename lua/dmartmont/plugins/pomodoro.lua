local Pomodoro = {
  'dmartmont/pomodoro.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  dev = true,
  opts = {
    work_duration = 30,
    break_short_duration = 15,
    break_long_duration = 30,
    timers_to_long_break = 4,
  },
  keys = {
    { '<leader>ps', '<cmd>PomodoroStart<cr>',  desc = 'start' },
    { '<leader>pp', '<cmd>PomodoroPause<cr>',  desc = 'pause' },
    { '<leader>px', '<cmd>PomodoroCancel<cr>', desc = 'cancel' },
  },
}

return Pomodoro
