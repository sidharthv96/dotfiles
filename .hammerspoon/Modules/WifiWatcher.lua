-- Mutes speakers when joining non Home networks, Unmutes when reaching home.
wifiWatcher = nil

function stopApp(name)
  app = hs.application.get(name)
  if app and app:isRunning() then
    app:kill()
  end
end

function forceKillProcess(name)
  hs.execute("pkill " .. name)
end

function startApp(name)
  hs.application.open(name)
end

local muteSSID = {
  ["Hacker"] = true,
  ["Hacker_5G"] = true,
  ["OnePlus 7T"] = true,
  ["clear-corporate"] = false
}

local lastSSID = hs.wifi.currentNetwork()
local officeSSID = "clear-corporate"
local urlToLoad = "http://8.8.8.8"
local browser = "Microsoft Edge Beta"
local i = 0

function reachedOffice()
    -- wait for few seconds
    hs.timer.doAfter(3, function()
        -- load the url
        hs.execute("open "..urlToLoad)
        -- lunch or focus the app
        hs.application.launchOrFocus(browser)
    end)
end

local function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()
    
    hs.audiodevice.defaultOutputDevice():setMuted(not (muteSSID[newSSID] or false))

    i = (i + 1) % 4
    print("."..newSSID..".")
    if newSSID == officeSSID and i == 0 then
        reachedOffice()
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
