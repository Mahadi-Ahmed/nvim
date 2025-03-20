local dap, dapui = require("dap"), require("dapui")
local dapGo = require('dap-go')

vim.keymap.set("n", "<leader>dt", function() dap.toggle_breakpoint() end, { desc = "toggle breakpoint" })
vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = 'continue' })
vim.keymap.set('n', '<leader>do', function() dap.step_over() end, { desc = 'step over' })
vim.keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = 'setp into' })
vim.keymap.set('n', '<leader>dO', function() dap.step_out() end, { desc = 'step out' })
vim.keymap.set('n', '<Leader>lp',
  function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = 'log point message' })

dapui.setup()
dapGo.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<Leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<Leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end)
