local wezterm = require('wezterm')
local config = wezterm.config_builder()
local appearance = require('appearance')
local projects = require('projects')
local tabline = wezterm.plugin.require('https://github.com/michaelbrusegard/tabline.wez')

local tokyo = wezterm.color.get_builtin_schemes()['Tokyo Night Storm']
tokyo.ansi[3] = '#73daca'
tokyo.brights[3] = '#73daca'
config.color_schemes = {
  ['Tokyo Night Storm Mod'] = tokyo,
}

tabline.setup({
  options = {
    icons_enabled = true,
    theme = appearance.is_dark() and tokyo or 'Tokyo Night Day',
    theme_overrides = {
      tab = {
        active = { bg = tokyo.brights[1] },
      },
    },
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = {
      'workspace',
    },
    tabline_c = {},
    tab_active = {
      { 'process', padding = { left = 0, right = 0 }, icons_only = true },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = {
      { 'process', padding = { left = 0, right = 0 }, icons_only = true },
    },
    tabline_x = {},
    tabline_y = { 'ram', 'cpu', 'battery' },
    tabline_z = { { 'datetime', style = '%I:%M' } },
  },
  extensions = {},
})

-- specific tabline config
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = 'NONE'

tabline.apply_to_config(config)

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
config.native_macos_fullscreen_mode = false
config.macos_fullscreen_extend_behind_notch = true
config.scrollback_lines = 10000

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

config.use_ime = false -- when enabled key repeat breaks input

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
    action = wezterm.action.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
  },
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key = ' ',
    mods = 'LEADER',
    action = wezterm.action.QuickSelect,
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = 'q',
    mods = 'LEADER',
    action = wezterm.action.PaneSelect({ mode = 'Activate' }),
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
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivateLastTab,
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'f',
    mods = 'CMD|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

local index_offset = config.tab_and_split_indices_are_zero_based and 0 or 1
for i = index_offset, 9 do
  table.insert(
    config.keys,
    { key = tostring(i), mods = 'LEADER', action = wezterm.action.ActivateTab(i - index_offset) }
  )
end

return config
