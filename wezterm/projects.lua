local wezterm = require('wezterm')
local module = {}

local home = wezterm.home_dir
local project_dir = home .. "/code"

local function project_dirs()
  local projects = {
    home .. '/.dotfiles',
    home .. '/notes',
  }

  for _, dir in ipairs(wezterm.glob(project_dir .. '/*')) do
    table.insert(projects, dir)
  end

  return projects
end

function module.choose_project()
  local choices = {}
  for _, value in ipairs(project_dirs()) do
    table.insert(choices, { label = value })
  end

  return wezterm.action.InputSelector {
    title = "Projects",
    choices = choices,
    fuzzy = true,
    action = wezterm.action_callback(function(child_window, child_pane, id, label)
      if not label then return end

      child_window:perform_action(wezterm.action.SwitchToWorkspace {
        name = label:match("([^/]+)$"),
        spawn = { cwd = label },
      }, child_pane)
    end),
  }
end

return module
