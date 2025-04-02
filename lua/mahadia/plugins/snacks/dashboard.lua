-- dashboard configuration
local M = {}

M.config = {
  enabled = true,
  width = 60,
  preset = {
    keys = {
      { icon = " ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },

    -- Used by the `header` section
    header = [[
          ⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⠀⠀⠀⠀⠀⠀           
          ⠀⠀⠀⢀⣴⡞⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣦⡀⠀⠀⠀           
           ⠀⣴⣿⠟⣤⡿⢁⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⡈⢿⣤⡙⣿⣦⡀            
           ⠺⠛⠟⠻⠛⠓⠛⠛⠛⠛⠛⠛⠛⠛⠛⠟⠛⠟⠆⠟⠛⠚⠟⠳            
          ⠀⡀⠂⠌⠀⠌⠠⠁⠌⠠⠁⠌⠠⠁⠌⠐⡀⠡⠀⠂⠈⠐⠀⢂⠐⠀           
⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣁⣐⣈⣀⣀⣐⣀⣀⣂⣐⣀⣈⣀⣂⣀⣐⣀⣂⣁⣀⣁⣂⣀⣁⣀⣀⣀⣀⣀⣀⣀⠀   
⠀⠀⠀⠻⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇⠀  ⠀
  ⠀⠀ |  \/  |     | |             | (_)       ⠀
  ⠀⠀⠀| .  . | __ _| |__   __ _  __| |_  __ _  ⠀
  ⠀⠀⠀| |\/| |/ _` | '_ \ / _` |/ _` | |/ _` | ⠀
  ⠀⠀⠀| |  | | (_| | | | | (_| | (_| | | (_| | ⠀
  ⠀⠀⠀\_|  |_/\__,_|_| |_|\__,_|\__,_|_|\__,_| ⠀]],
  },

  sections = {
    { section = "header" },
    { icon = " ", title = "Recent Files", section = "recent_files", indent = 0, padding = { 1, 0 } , cwd = true },
    { section = "keys",   gap = 0, padding = {1, 0} },
    { section = "startup" },
  },
}

return M.config
