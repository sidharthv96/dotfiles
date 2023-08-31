-- Avoid automatically setting a bluetooth audio input device

lastSetDeviceTime = os.time()
lastInputDevice = nil

function audioDeviceChanged(arg)
    if arg == 'dev#' then
        lastSetDeviceTime = os.time()
    elseif arg == 'dIn ' and os.time() - lastSetDeviceTime < 2 then
        inputDevice = hs.audiodevice.defaultInputDevice()
        if inputDevice:transportType() == 'Bluetooth' then
            internalMic = lastInputDevice or hs.audiodevice.findInputByName('USB Condenser Microphone') or hs.audiodevice.findInputByName('MacBook Pro Microphone') or hs.audiodevice.findInputByName('Built-in Microphone') or hs.audiodevice.findInputByName('Internal Microphone')
            internalMic:setDefaultInputDevice()
        end
    end
    if hs.audiodevice.defaultInputDevice():transportType() ~= 'Bluetooth' then
        lastInputDevice = hs.audiodevice.defaultInputDevice()
    end
end

hs.audiodevice.watcher.setCallback(audioDeviceChanged)
hs.audiodevice.watcher.start()
