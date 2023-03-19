  -- if has("persistent_undo")
  --    let target_path = expand('~/.undodir')
  --
  --     " create the directory and any parent directories
  --     " if the location does not exist.
  --     if !isdirectory(target_path)
  --         call mkdir(target_path, "p", 0700)
  --     endif
  --
  --     let &undodir=target_path
  --     set undofile
  -- endif
if "persistent_undo" then
  local target_path = '~/.undodir'
    -- " create the directory and any parent directories
    -- " if the location does not exist.

  if not isdir(target_path) then
end
