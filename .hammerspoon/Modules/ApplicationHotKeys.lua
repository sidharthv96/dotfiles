require("common")

local applicationHotkeys = {
  a = 'Microsoft Edge Beta',
  d = 'iTerm',
  i = 'IntelliJ IDEA',
  s = 'Slack',
  c = 'Visual Studio Code',
  p = 'Postman',
}

local killMode = false
local fallBack = hs.timer.delayed.new(5, function()
  killMode = false
end)

hs.hotkey.bind(hyper, 'k', function()
    killMode = true
    if( killMode ) then
      hs.notify.show("Kill mode on", "Press Caps + <hotKey>", 'to kill application')      
      fallBack.start()
    end
  end)

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    if ( not killMode ) 
    then
      hs.application.launchOrFocus(app)
    else 
      x = hs.application.find(app)
      x.kill(x)
    end
  end)
end