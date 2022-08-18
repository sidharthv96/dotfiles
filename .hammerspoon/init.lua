require("common")
require("AutoImport")

Install:andUse("FnMate")

Install:andUse("HeadphoneAutoPause",
               {
                 start = true
               }
)

Install:andUse('MicMute', {hotkeys = {toggle = {{"alt"}, "space"}}})

-- Install:andUse("Caffeine",
--                {
--                  start = true
--                }
-- )

-- Install:andUse("ClipboardTool",
--                {
--                  disable = false,
--                  config = {
--                    show_copied_alert = false,
--                    show_in_menubar = false,
--                    paste_on_select = true,
--                  },
--                  hotkeys = {
--                    toggle_clipboard = { { "cmd", "shift" }, "v" } 
--                   },
--                  start = true,
--                }
-- )

-- Install:andUse("WindowScreenLeftAndRight",
--                {
--                  hotkeys = 'default'
--                }
-- )

-- Load Seal - This is a pretty simple implementation of something like Alfred
-- Install:andUse("Seal",
--   {
--     hotkeys = {
--         show = { hyper, "Space" }
--     },
--     fn = function(s)
--         s:loadPlugins({"useractions"})
--         s.plugins.useractions.actions = {
--             ["DuckDuckGo"] = { url = "https://duckduckgo.com/?q=${query}&kp=-1&kl=in-en&kn=1&kz=1&kac=1&kae=d&k1=-1", icon="favicon", keyword="d" },
--             ["MDN"] = { url = "https://developer.mozilla.org/en-US/search?q=${query}", icon="favicon", keyword="mdn" },
--             ["Google"] = { url = "https://www.google.co.in/search?q=${query}", icon="favicon", keyword="g " }            
--         }
--     end,
--     start = true
--   }
-- )


Install:andUse("WindowGrid",
               {
                 config = { gridGeometries = { { "6x4" } } },
                 hotkeys = {show_grid = {hyper, "g"}},
                 start = true
               }
)

-- usbWatcher = nil

-- function usbDeviceCallback(data)
--   print(data)
--   print(data["productName"])

--   hs.inspect.inspect(data)
--     if (data["productName"] == "DELL DA300") then
--         if (data["eventType"] == "added") then
--             hs.application.launchOrFocus("Slack")
--         elseif (data["eventType"] == "removed") then
--             -- app = hs.appfinder.appFromName("ScanSnap Manager")
--             -- app:kill()
--             print("Dock disconnected")
--         end
--     end
-- end

-- usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
-- usbWatcher:start()