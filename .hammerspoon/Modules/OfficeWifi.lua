
-- local officeWifi = "OnePlus 7T"
-- -- local officeWifi = "clear-corporate"
-- local urlToLoad = "http://1.1.1.1"
-- local browser = "Microsoft Edge Beta"
-- local i = 0
-- local watcher = hs.wifi.watcher.new(function()
-- 	local ssid = hs.wifi.currentNetwork()

-- 	-- load the url when office wifi is connected
--     if ssid == officeWifi and i == 0 then
--         i = (i + 1)%2
-- 		-- wait for few seconds
-- 		hs.timer.doAfter(3, function()
-- 			-- load the url
-- 			hs.execute("open "..urlToLoad)
-- 			-- lunch or focus the app
-- 			hs.application.launchOrFocus(browser)
-- 		end)
-- 	end

-- end):start()