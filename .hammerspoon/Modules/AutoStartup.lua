require("common")

local apps = {'Time Out'}
for i, name in ipairs(apps) do
    hs.application.launchOrFocus(name)
end
