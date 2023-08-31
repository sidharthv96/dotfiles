
-- usbWatcher = nil

-- function usbDeviceCallback(data)
--     print(hs.inspect.inspect(data))
--     if data["productName"] == "DELL DA300" then
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
