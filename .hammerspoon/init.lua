hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  -- hs.alert.show("Hello World!")
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()

function watchInputSource(appName,eventType,app)
    if eventType==hs.application.watcher.activated then
        hs.keycodes.currentSourceID("com.google.inputmethod.Japanese.Roman")
    end
end
inputSourceWatcher=hs.application.watcher.new(watchInputSource)
inputSourceWatcher:start()

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "0", function()
    local screen=hs.screen.mainScreen()
    local screenFrame=screen:frame()
    local win=hs.window.focusedWindow()
    local winFrame=win:frame()

    local comfortHeight= 1600
    local unitWidth=950
    local centerPointX=(screenFrame.w/2)

    if winFrame.w % unitWidth ~= 0 then
        winFrame.w=unitWidth
        winFrame.x=centerPointX-(winFrame.w/2)
    elseif winFrame.w / unitWidth  == 1 then
        winFrame.w=unitWidth*2
        winFrame.x=centerPointX-(winFrame.w/2)+300
    elseif winFrame.w / unitWidth  == 2 then
        winFrame.w=unitWidth*3
        winFrame.x=centerPointX-(winFrame.w/2)+500
    else
        winFrame.w=unitWidth
        winFrame.x=centerPointX-(winFrame.w/2)
    end

    winFrame.y=screenFrame.h-comfortHeight
    winFrame.h=comfortHeight

    win:setFrame(winFrame)
end)

hs.hotkey.bind({"cmd"}, "9", function()
    hs.keycodes.currentSourceID("com.google.inputmethod.Japanese.Roman")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
  local screen = hs.screen.mainScreen()
  screenFrame=screen:frame()
  local win = hs.window.focusedWindow()
  windowFrame=win:frame()


  local baseX=(screenFrame.w/2)-(windowFrame.w/2)
  bottomFrame=hs.geometry(baseX, screenFrame.h-windowFrame.h)
  windowFrame.x=bottomFrame.x
  windowFrame.y=bottomFrame.y
  win:setFrame(windowFrame)

  -- local targetPoint=hs.geometry.point(windowFrame.x+(windowFrame.w/2), windowFrame.y+(windowFrame.h/2))
  -- hs.mouse.absolutePosition(targetPoint)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "X", function()
    local chrome=hs.application.find("Chrome")
    local iterm=hs.application.find("iTerm")
    if chrome:isFrontmost() then
        iterm:setFrontmost()
    else
        chrome:setFrontmost()

        local win = hs.window.focusedWindow()
        windowFrame=win:frame()

        -- -- hs.geometry.point(x, y) -> hs.geometry point
        -- local targetPoint=hs.geometry.point(windowFrame.x+(windowFrame.w/2), windowFrame.y+(windowFrame.h/2))
        -- hs.mouse.absolutePosition(targetPoint)
    end
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  local screen=hs.screen.mainScreen()
  local screenFrame=screen:frame()
  local win=hs.window.focusedWindow()
  local winFrame=win:frame()

  local screenFrameWidthPerUnit=screenFrame.w/3
  local comfortHeight= 1600

  if winFrame.x==0 then
      -- to center
      winFrame.x=screenFrameWidthPerUnit
  elseif winFrame.x==screenFrameWidthPerUnit then
      -- to right
      winFrame.x=screenFrameWidthPerUnit*2
  elseif winFrame.x==screenFrameWidthPerUnit*2 then
      -- to left
      winFrame.x=0
  else
      -- to center
      winFrame.x=screenFrameWidthPerUnit
  end

  winFrame.w=screenFrameWidthPerUnit
  winFrame.y=screenFrame.h-comfortHeight
  winFrame.h=comfortHeight
  win:setFrame(winFrame)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  local screen = hs.screen.mainScreen()
  screenFrame=screen:frame()
  local win = hs.window.focusedWindow()
  windowFrame=win:frame()


  local baseX=(screenFrame.w/2)-(windowFrame.w/2)
  topFrame   =hs.geometry(baseX, 0)
  bottomFrame=hs.geometry(baseX, screenFrame.h-windowFrame.h)
  if windowFrame.x==topFrame.x and windowFrame.y==topFrame.y then
      windowFrame.x=bottomFrame.x
      windowFrame.y=bottomFrame.y
  elseif windowFrame.x==bottomFrame.x and windowFrame.y==bottomFrame.y then
      windowFrame.x=topFrame.x
      windowFrame.y=topFrame.y
  else
      windowFrame.x=bottomFrame.x
      windowFrame.y=bottomFrame.y
  end

  win:setFrame(windowFrame)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Q", function()
  hs.reload()
end)

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

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "G", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.w = f.w + 550
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 550
  f.h = f.h - 550
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "D", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 550
  f.h = f.h + 550
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.w = f.w - 550
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 420
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", function()
    local rightScreen = "LG HDR 4K"
    local windowLayout = {
        {"Chrome" , nil , rightScreen , {x=0.25 , y=0.24 , w=0.30 , h=0.76} , nil , nil} , 
        {"ITerm"  , nil , rightScreen , {x=0.55 , y=0.24 , w=0.25 , h=0.76} , nil , nil} , 
    }
    hs.layout.apply(windowLayout)
    hs.alert.show("applied") 
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, ";", function()
    local leftScreen = "PHL 328P6V"
    local windowLayout = {
        {"DeepL"      , nil , leftScreen , {x=0 , y=0    , w=1 , h=0.33} , nil , nil} , 
        {"Dictionary" , nil , leftScreen , {x=0 , y=0    , w=1 , h=0.33} , nil , nil} , 
        {"Safari"     , nil , leftScreen , {x=0 , y=0.33 , w=1 , h=0.73} , nil , nil} , 

        -- {"Dictionary" , nil , leftScreen , {x=0 , y=0 ,    w=1 , h=0.33} , nil , nil} , 
        -- {"Safari"     , nil , leftScreen , {x=0 , y=0.33 , w=1 , h=0.73} , nil , nil} , 

        -- {"DeepL"      , nil , leftScreen , {x=0 , y=0    , w=1 , h=0.33} , nil , nil} , 
        -- {"Firefox"    , nil , leftScreen , {x=0 , y=0    , w=1 , h=0.33} , nil , nil} , 
        -- {"Dictionary" , nil , leftScreen , {x=0 , y=0.33 , w=1 , h=0.33} , nil , nil} , 
        -- {"Safari"     , nil , leftScreen , {x=0 , y=0.43 , w=1 , h=0.73} , nil , nil} , 
    }
    hs.layout.apply(windowLayout)
    hs.alert.show("applied") 
end)
