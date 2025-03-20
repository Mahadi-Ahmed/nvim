local dap, dapui = require("dap"), require("dapui")

-- dapui.setup({
--   icons = {
--     expanded = "▾",
--     collapsed = "▸",
--     current_frame = "→"
--   },
--   controls = {
--     icons = {
--       pause = "⏸",
--       play = "▶",
--       step_into = "⏎",
--       step_over = "⏭",
--       step_out = "⏮",
--       step_back = "b",
--       run_last = "▶▶",
--       terminate = "⏹",
--       disconnect = "⏏",
--     },
--   },
-- })
-- Set up UI

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local function setup_js_adapter()
  if not pcall(require, "dap-vscode-js") then
    return
  end

  require("dap-vscode-js").setup({
    debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
  })

  for _, language in ipairs({
    "typescript", "javascript", "typescriptreact",
    "javascriptreact", "astro", "vue"
  }) do
    dap.configurations[language] = {
      -- Node.js
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require('dap.utils').pick_process,
        cwd = "${workspaceFolder}",
      },
      -- Jest
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Jest Tests",
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/jest/bin/jest.js",
          "--runInBand",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
      -- Astro dev server
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Astro Dev Server",
        url = "http://localhost:4321", -- Default Astro dev server port
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
      },
      -- Vue CLI/Vite dev server
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Vue Dev Server (Chrome)",
        url = function()
          local default_url = "http://localhost:5173" -- Default Vite port
          local url = vim.fn.input('URL: ', default_url)
          return url
        end,
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        sourceMapPathOverrides = {
          -- For Vite
          ["webpack:///./~/*"] = "${webRoot}/node_modules/*",
          ["webpack:///./*"] = "${webRoot}/*",
          ["webpack:///*"] = "*",
          -- Handling Vue source maps
          ["webpack:///src/*"] = "${webRoot}/src/*",
        },
      },
      -- Vitest debugging
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Vitest Tests",
        cwd = "${workspaceFolder}",
        program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
        args = { "run", "--threads", "false" },
        autoAttachChildProcesses = true,
        smartStep = true,
        console = "integratedTerminal",
        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
      },
      -- Generic NPM script
      {
        type = "pwa-node",
        request = "launch",
        name = "Run npm script",
        runtimeExecutable = "npm",
        runtimeArgs = {
          "run-script",
          function()
            return vim.fn.input('Script name: ')
          end
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
      -- Browser debugging
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Chrome",
        url = function()
          local default_url = "http://localhost:3000"
          local url = vim.fn.input('URL: ', default_url)
          return url
        end,
        webRoot = "${workspaceFolder}",
        userDataDir = "${workspaceFolder}/.vscode/chrome-debug-profile",
      }
    }
  end
end

local function setup_go_adapter()
  if not pcall(require, "dap-go") then
    return
  end
  require("dap-go").setup()
end

local filetypes = {
  ["go"] = setup_go_adapter,
  ["javascript"] = setup_js_adapter,
  ["typescript"] = setup_js_adapter,
  ["javascriptreact"] = setup_js_adapter,
  ["typescriptreact"] = setup_js_adapter,
  ["astro"] = setup_js_adapter,
  ["vue"] = setup_js_adapter,
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(filetypes),
  callback = function()
    local filetype = vim.bo.filetype
    if filetypes[filetype] then
      filetypes[filetype]()
    end
  end,
})


-- Common keymappings (these work regardless of filetype)
vim.keymap.set("n", "<leader>dt", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>dO", function() dap.step_out() end, { desc = "Step out" })
vim.keymap.set("n", "<leader>db", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
  { desc = "Breakpoint condition" })
vim.keymap.set("n", "<leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
  { desc = "Log point message" })
vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "Open REPL" })
vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run last" })

-- Dap UI specific keymaps
vim.keymap.set("n", "<leader>de", function() dapui.eval() end, { desc = "Eval expression" })
vim.keymap.set("v", "<leader>de", function() dapui.eval() end, { desc = "Eval selection" })
vim.keymap.set("n", "<leader>dh", function() require("dap.ui.widgets").hover() end, { desc = "Hover variables" })
vim.keymap.set("n", "<leader>dS", function() require("dap.ui.widgets").scopes() end, { desc = "Scopes" })
vim.keymap.set("n", "<leader>dU", function() dapui.toggle() end, { desc = "Toggle UI" })

-- VS Code launch.json support
require('dap.ext.vscode').load_launchjs(nil, {
  ['pwa-node'] = { 'javascript', 'typescript', 'astro', 'vue' },
  ['node'] = { 'javascript', 'typescript', 'astro', 'vue' },
  ['chrome'] = { 'javascript', 'typescript', 'astro', 'vue' },
  ['pwa-chrome'] = { 'javascript', 'typescript', 'astro', 'vue' },
  ['go'] = { 'go' }
})
