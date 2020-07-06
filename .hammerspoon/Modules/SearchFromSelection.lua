require("common")

function copyAndSearch(url)
    hs.timer.doAfter(.25, function()
        hs.eventtap.keyStroke({"cmd"}, "c")
        hs.timer.doAfter(.25, function()
                local board = hs.pasteboard.getContents()
                hs.execute("open ".."\""..url..board.."\"")
                hs.application.launchOrFocus(browser)
            end)
    end)
end


hs.hotkey.bind(hyper, "W", function()
    copyAndSearch("https://www.google.co.in/search?q=")
    end)



hs.hotkey.bind(hyper, "Q", function()
    copyAndSearch("https://duckduckgo.com/?kp=-1&kl=in-en&kn=1&kz=1&kac=1&kae=d&k1=-1&q=")
    end)