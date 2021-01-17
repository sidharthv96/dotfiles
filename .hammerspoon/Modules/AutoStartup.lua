require("common")

local apps = {'Time Out', 'Duplicati'}
for i, name in ipairs(apps) do
    hs.application.launchOrFocus(name)
end
