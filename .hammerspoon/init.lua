hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  -- hs.alert.show("Hello World!")
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

-- hs.loadSpoon("AClock")
-- spoon.AClock:init()
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
--   spoon.AClock:toggleShow()
-- end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 20
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 20
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 20
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 20
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 50
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 50
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "I", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 50
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "O", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 50
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "6", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 300
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "7", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 300
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "8", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 300
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "9", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 300
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "=", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 550
  f.h = f.h + 550
  win:setFrame(f)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "-", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 550
  f.h = f.h - 550
  win:setFrame(f)
end)
