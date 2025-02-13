event = "BufRead"        -- When a buffer is read
event = "BufReadPost"    -- After a buffer is read
event = "BufNewFile"     -- When starting to edit a new file
event = "BufAdd"         -- When a buffer is added
event = "BufEnter"       -- When entering a buffer
event = "BufWinEnter"    -- When a buffer is displayed in a window
event = "BufWritePre"    -- Before writing a buffer
event = "BufWritePost"   -- After writing a buffer

event = "FileType"       -- When file type is set

event = "WinScrolled"    -- When window is scrolled
event = "WinResized"     -- When window is resized
event = "WinNew"         -- When a window is created

event = "VeryLazy"       -- After UI is ready
event = "InsertEnter"    -- When entering insert mode
event = "CmdlineEnter"   -- When entering command line
event = "User FileOpened" -- Custom event, after a file is opened

-- You can also use multiple events:
event = { "BufReadPre", "BufNewFile" }
