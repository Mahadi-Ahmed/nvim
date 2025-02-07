local harpoon = require("harpoon")

-- REQUIRED: Setup harpoon
harpoon:setup({
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
    key = function()
      return vim.loop.cwd()
    end,
  }
})

-- Add extended functionality for splits and tabs in the UI
harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-x>", function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr })
  end,
})

-- Setup telescope integration function
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = require("telescope.config").values.file_previewer({}),
        sorter = require("telescope.config").values.generic_sorter({}),
    }):find()
end

-- Make telescope function available globally for whichkey to use
_G.harpoon_telescope = function()
    toggle_telescope(harpoon:list())
end
