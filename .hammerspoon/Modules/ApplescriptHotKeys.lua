require("common")

local applicationHotkeys = {
  v = 'vpn',
  ['-'] = 'mute_zoom'
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
      hs.osascript.applescriptFromFile(hs.fs.currentDir().."/Modules/scripts/"..app..".apsc")
  end)
end