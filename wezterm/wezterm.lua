local wezterm = require('wezterm')
local config = wezterm.config_builder()
local appearance = require('appearance')
local projects = require('projects')

local tokyo = wezterm.color.get_builtin_schemes()['Tokyo Night Storm']
tokyo.ansi[3] = '#73daca'
tokyo.brights[3] = '#73daca'
config.color_schemes = {
  ['Tokyo Night Storm Mod'] = tokyo,
}

local function set_color_scheme()
  if appearance.is_dark() then
    config.color_scheme = 'Tokyo Night Storm Mod'
  else
    config.color_scheme = 'Tokyo Night Day'
  end
end

set_color_scheme()

wezterm.on('window-config-reloaded', function()
  set_color_scheme()
end)

config.font_size = 16
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = false
config.native_macos_fullscreen_mode = true

config.window_frame = {
  font = wezterm.font({ family = 'JetBrainsMono Nerd Font', weight = 'Bold' }),
  font_size = 14,
}

local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

-- TODO: update for resize
local function split_nav(key)
  return {
    key = key,
    mods = 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = 'CTRL' },
        }, pane)
      else
        win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
      end
    end),
  }
end

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey({ key = 'a', mods = 'CTRL' }),
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab('CurrentPaneDomain'),
  },
  split_nav('h'),
  split_nav('j'),
  split_nav('k'),
  split_nav('l'),
  {
    key = 't',
    mods = 'LEADER',
    action = projects.choose_project(),
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' })
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'f',
    mods = 'CMD|CTRL',
    action = wezterm.action.ToggleFullScreen
  },
}

local function segments_for_right_status(window)
  return {
    -- %Y-%m-%d  %I:%M
    -- wezterm.strftime('%a %b %-d %H:%M'),
    wezterm.strftime('%I:%M'),
    wezterm.strftime('%Y-%m-%d'),
    window:active_workspace(),
  }
end

wezterm.on('update-status', function(window, _)
  local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
  local right_segments = segments_for_right_status(window)

  local color_scheme = window:effective_config().resolved_palette
  local bg = wezterm.color.parse(color_scheme.background)
  local fg = color_scheme.foreground

  local gradient_to, gradient_from = bg, bg
  if appearance.is_dark() then
    gradient_from = gradient_to:lighten(0.2)
  else
    gradient_from = gradient_to:darken(0.2)
  end

  local right_gradient = wezterm.color.gradient(
    {
      orientation = 'Horizontal',
      colors = { gradient_from, gradient_to },
    },
    #right_segments -- only gives us as many colours as we have segments.
  )

  -- We'll build up the elements to send to wezterm.format in this table.
  local right_elements = {}

  for i, seg in ipairs(right_segments) do
    local is_first = i == 1

    if is_first then
      table.insert(right_elements, { Background = { Color = 'none' } })
    end
    table.insert(right_elements, { Foreground = { Color = right_gradient[i] } })
    table.insert(right_elements, { Text = SOLID_LEFT_ARROW })

    table.insert(right_elements, { Foreground = { Color = fg } })
    table.insert(right_elements, { Background = { Color = right_gradient[i] } })
    table.insert(right_elements, { Text = ' ' .. seg .. ' ' })
  end

  window:set_right_status(wezterm.format(right_elements))
end)

return config
