local setup, surround = pcall(require, "mini.surround")
if not setup then
  return
end

surround.setup({
  -- Use default mappings with 's' prefix
  mappings = {
    add = "sa",                  -- Add surrounding in Normal and Visual modes
    delete = "sd",               -- Delete surrounding
    find = "sf",                 -- Find surrounding (to the right)
    find_left = "sF",            -- Find surrounding (to the left)
    highlight = "sh",            -- Highlight surrounding
    replace = "sr",              -- Replace surrounding
    update_n_lines = "sn",       -- Update 'n_lines'

    suffix_last = "l",
    suffix_next = "n",
  },

  -- Other configuration options
  n_lines = 20,
  highlight_duration = 500,
  respect_selection_type = true,       -- Better handling of linewise/blockwise selections
  search_method = "cover_or_next",
})
