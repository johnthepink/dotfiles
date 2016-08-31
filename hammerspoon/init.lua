local hyper = {"cmd", "alt", "shift", "ctrl"}

-- reload config
hs.hotkey.bind(hyper, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")

-- hard paste on steppas
hs.hotkey.bind(hyper, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- hotkeys for apps
local focusKeys = {
  b="Google Chrome",
  l="Dark Slack",
  x="Xcode",
  e="Boxy",
  i="iTerm",
  m="Messages",
  t="Tweetbot",
  c="Calendar",
  s="Spotify",
  u="iTunes",
  y="Byword",
  o="1Password",
}

for key in pairs(focusKeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(focusKeys[key])
  end)
end
