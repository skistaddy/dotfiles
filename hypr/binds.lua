local super = "SUPER" -- Sets "Windows" key as main modifier
local shift = super .. " + SHIFT"
local terminal    = "kitty"
local fileManager = "kitty yazi"
local menu = "pkill rofi || rofi -show drun"
local screenshot = "/home/skistaddy/scripts/screenshot.sh"

hl.bind(super .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(super .. " + P", hl.dsp.exec_cmd(screenshot))
hl.bind(super .. " + F", hl.dsp.window.fullscreen())
hl.bind(super .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(super .. " + Q", hl.dsp.window.close())
hl.bind(super .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(super .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(super .. " + SUPER_L", hl.dsp.exec_cmd(menu))

hl.bind(super .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(super .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(super .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(super .. " + down",  hl.dsp.focus({ direction = "down" }))

local function moveWindow(dir)
    return function()
        local win_before = hl.get_active_window()
        if not win_before then return end

        -- Extract the exact starting workspace ID safely
        local ws_before = win_before.workspace and (win_before.workspace.id or win_before.workspace)

        -- Define relative workspace offset targets
        local workspace_jumps = {
            left  = -1,
            up    = -1,
            right = 1,
            down  = 1
        }
        local offset = workspace_jumps[dir]
        if not offset then return end

        -- Calculate the absolute destination numerical workspace ID up front
        local target_ws = tostring(tonumber(ws_before) + offset)

        -- 1. TRY TO MOVE NATIVELY: Instatiate a completely isolated, single-purpose object
        hl.dispatch(hl.dsp.window.move({ direction = dir }))

        -- 2. Grab the state immediately following the layout shift execution
        local win_after = hl.get_active_window()
        if not win_after then return end
        
        local ws_after = win_after.workspace and (win_after.workspace.id or win_after.workspace)

        -- 3. EDGE TRIGGERED: Only cross workspaces if the layout blocked the move command
        if tostring(ws_before) == tostring(ws_after) then
            
            -- Explicitly use 'movetoworkspacesilent' syntax natively or use a fresh table object.
            -- This cuts out carried-over layout tags that cause the window-kicking/maximizing bugs.
            hl.dispatch(hl.dsp.window.move({ 
                workspace = target_ws, 
                silent = true,
                window = "address:" .. win_before.address
            }))
            
            -- Focus your screen viewport straight onto the destination workspace index
            hl.dispatch(hl.dsp.focus({ workspace = target_ws }))
        end
    end
end

hl.bind(shift .. " + left",  moveWindow("left"))
hl.bind(shift .. " + right", moveWindow("right"))
hl.bind(shift .. " + up",    moveWindow("up" ))
hl.bind(shift .. " + down",  moveWindow("down"))

hl.bind(super .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(super .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(super .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(super .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

