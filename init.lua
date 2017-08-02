-- Taken from https://gist.github.com/arbelt/b91e1f38a0880afb316dd5b5732759f1

sends_escape = true
last_mods = {}

control_key_timer = hs.timer.delayed.new(0.15, function() send_escape = false end)

control_handler = function(evt)
  local new_mods = evt:getFlags()
  if last_mods["ctrl"] == new_mods["ctrl"] then
    return false
  end
  if not last_mods["ctrl"] then
    last_mods = new_mods
    send_escape = true
    control_key_timer:start()
  else
    last_mods = new_mods
    control_key_timer:stop()
    if send_escape then
      return true, {
        hs.eventtap.event.newKeyEvent({}, 'escape', true),
        hs.eventtap.event.newKeyEvent({}, 'escape', false),
                   }
    end
  end
  return false
end

control_tap = hs.eventtap.new({12}, control_handler)
control_tap:start()

-- remap ctrl-b,n,p,f to arrow keys

local function remap(mods, key, newKey)
	pressFn = function()
    hs.eventtap.keyStroke({}, newKey, 1000)
  end

	return hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end

bindings = {
  remap({'ctrl'}, 'b', 'left'),
  remap({'ctrl'}, 'f', 'right'),
  remap({'ctrl'}, 'n', 'down'),
  remap({'ctrl'}, 'p', 'up')
}

local function handleAppEvents(appname, eventType, app)
  if appname ~= 'Emacs' then return end
  if eventType == hs.application.watcher.activated then
    for k,v in pairs(bindings) do v:disable() end
  elseif eventType == hs.application.watcher.deactivated then
    for k,v in pairs(bindings) do v:enable() end
  end
end

watcher = hs.application.watcher.new(handleAppEvents)
watcher:start()

hs.hotkey.bind({'cmd'}, '[',
  function() hs.eventtap.keyStroke({'ctrl', 'shift'}, 'tab', 1000) end, nil,
  function() hs.eventtap.keyStroke({'ctrl', 'shift'}, 'tab', 1000) end)
hs.hotkey.bind({'cmd'}, ']',
  function() hs.eventtap.keyStroke({'ctrl'}, 'tab', 1000) end, nil,
  function() hs.eventtap.keyStroke({'ctrl'}, 'tab', 1000) end)


mod1 = {'option', 'shift'}
mod2 = {'ctrl', 'option', 'shift'}
mod3 = {'ctrl', 'option'}

hs.hotkey.bind({'cmd'}, 'j',
  function() hs.eventtap.keyStroke(mod1, 'j', 1000) end, nil,
  function() hs.eventtap.keyStroke(mod1, 'j', 1000) end)
hs.hotkey.bind({'cmd'}, 'k',
  function() hs.eventtap.keyStroke(mod1, 'k', 1000) end, nil,
  function() hs.eventtap.keyStroke(mod1, 'k', 1000) end)
hs.hotkey.bind({'cmd'}, 'h',
  function() hs.eventtap.keyStroke(mod1, 'h', 1000) end, nil,
  function() hs.eventtap.keyStroke(mod1, 'h', 1000) end)
hs.hotkey.bind({'cmd'}, 'l',
 function() hs.eventtap.keyStroke(mod1, 'l', 1000) end, nil,
  function() hs.eventtap.keyStroke(mod1, 'l', 1000) end)

k = hs.hotkey.modal.new('ctrl', 'space')
uuid = ''
function k:entered() uuid = hs.alert.show('Amethyst mode','') end
function k:exited() hs.alert.closeSpecific(uuid) end
k:bind('', 'escape', function() k:exit() end)
k:bind('', 'space', function() hs.eventtap.keyStroke(mod1, 'space', 1000) end)
k:bind('shift', 'space', function() hs.eventtap.keyStroke(mod2, 'space', 1000) end)
k:bind('', 'o', function() hs.eventtap.keyStroke(mod1, 'w', 1000) end)
k:bind('', 'e', function() hs.eventtap.keyStroke(mod1, 'e', 1000) end)
k:bind('shift', 'o', function() hs.eventtap.keyStroke(mod2, 'w', 1000) end)
k:bind('shift', 'e', function() hs.eventtap.keyStroke(mod2, 'e', 1000) end)
k:bind('', '0', function() hs.eventtap.keyStroke(mod2, '1', 1000) end)
k:bind('', '1', function() hs.eventtap.keyStroke(mod2, '2', 1000) end)
k:bind('', '2', function() hs.eventtap.keyStroke(mod2, '3', 1000) end)
k:bind('', '3', function() hs.eventtap.keyStroke(mod2, '4', 1000) end)
k:bind('', '4', function() hs.eventtap.keyStroke(mod2, '5', 1000) end)
k:bind('', '5', function() hs.eventtap.keyStroke(mod2, '6', 1000) end)
k:bind('', '6', function() hs.eventtap.keyStroke(mod2, '7', 1000) end)
k:bind('', '7', function() hs.eventtap.keyStroke(mod2, '8', 1000) end)
k:bind('', '8', function() hs.eventtap.keyStroke(mod2, '9', 1000) end)
k:bind('', '9', function() hs.eventtap.keyStroke(mod2, '0', 1000) end)
k:bind('', 'left', function() hs.eventtap.keyStroke(mod2, 'left', 1000) end)
k:bind('', 'right', function() hs.eventtap.keyStroke(mod2, 'right', 1000) end)
k:bind('', ',', function() hs.eventtap.keyStroke(mod1, ',', 1000) end)
k:bind('', '.', function() hs.eventtap.keyStroke(mod1, '.', 1000) end)
k:bind('', 'j', function() hs.eventtap.keyStroke(mod1, 'j', 1000) end)
k:bind('', 'k', function() hs.eventtap.keyStroke(mod1, 'k', 1000) end)
k:bind('', 'h', function() hs.eventtap.keyStroke(mod1, 'h', 1000) end)
k:bind('', 'l', function() hs.eventtap.keyStroke(mod1, 'l', 1000) end)
k:bind('shift', 'j', function() hs.eventtap.keyStroke(mod2, 'j', 1000) end)
k:bind('shift', 'k', function() hs.eventtap.keyStroke(mod2, 'k', 1000) end)
k:bind('shift', 'h', function() hs.eventtap.keyStroke(mod2, 'h', 1000) end)
k:bind('shift', 'l', function() hs.eventtap.keyStroke(mod2, 'l', 1000) end)
k:bind('', 'return', function() hs.eventtap.keyStroke(mod1, 'return', 1000) end)
k:bind('', 't', function() hs.eventtap.keyStroke(mod1, 't', 1000) end)
k:bind('shift', 't', function() hs.eventtap.keyStroke(mod2, 't', 1000) end)
k:bind('', 'i', function() hs.eventtap.keyStroke(mod1, 'i', 1000) end)
k:bind('', 'z', function() hs.eventtap.keyStroke(mod1, 'z', 1000) end)

hs.alert.show("Config Loaded")
