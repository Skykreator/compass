local myinfo = 0
local icarus = 0

script.on_event(defines.events.on_player_joined_game, function(event)
    local new_player = game.players[event.player_index]
    local lGui = new_player.gui.left
    if lGui.compass == nil then
        local button = lGui.add{
            type = "sprite-button",
            tooltip = "Click to Enlarge",
            name = "compass",
            sprite = "compass128",
        
        }
    end
    lGui.compass.style.horizontally_stretchable = "on"
    lGui.compass.style.vertically_stretchable = "on"
    lGui.compass.style.natural_width = 33
    lGui.compass.style.natural_height = 33
    lGui.compass.style.maximal_width = 8191
    lGui.compass.style.maximal_height = 8191

    lGui.compass.style.top_padding = 0
    lGui.compass.style.bottom_padding = 0
    lGui.compass.style.right_padding = 0
    lGui.compass.style.left_padding = 0
end)

script.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == "compass" and not (myinfo == 2) then
        local num = math.random(1000)
        myinfo = 0
        event.element.sprite = "compass128"
        event.element.tooltip = "Click to Enlarge"
        if num < event.element.style.natural_width / 8 and not (myinfo == 1) then
            myinfo = 1
            icarus = icarus + 1
            event.element.sprite = "yes4"
            event.element.tooltip = "Careful Icarus"
            if num < 2 + event.element.style.natural_width / 32 and event.element.style.natural_width > 129 and icarus > 1 then
                myinfo = 2
                event.element.sprite = "no4"
                event.element.tooltip = "Infinite Compass.... but no compass"
            end
        end
        event.element.style.natural_width = event.element.style.natural_width + math.random(3) - 1
        event.element.style.natural_height = event.element.style.natural_height + math.random(3) - 1
    end

end)