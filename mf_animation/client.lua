
 --___ ___  __ __  ____   _____  ____   ____  _____   ___    ___  
 --|   |   ||  |  ||    \ |     ||    \ |    ||     | /   \  /   \ 
 --| _   _ ||  |  ||  _  ||   __||  D  ) |  | |__/  ||     ||     |
 --|  \_/  ||  |  ||  |  ||  |_  |    /  |  | |   __||  O  ||  O  |
 --|   |   ||  :  ||  |  ||   _] |    \  |  | |  /  ||     ||     |
-- |   |   ||     ||  |  ||  |   |  .  \ |  | |     ||     ||     |
 --|___|___| \__,_||__|__||__|   |__|\_||____||_____| \___/  \___/ 
                                                                 
 

local Farm = {
    x = 268.85009765625, y = 6479.5908203125, z = 30.360904693604
}
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetDistanceBetweenCoords(Farm.x,Farm.y,Farm.z, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
            if IsPedActiveInScenario(PlayerPedId()) then
                DrawText3D(Farm.x, Farm.y, Farm.z, "[~r~Z~w~] For at stoppe med at høste")
            else
             DrawText3D(Farm.x, Farm.y, Farm.z, "[~r~E~w~] For at starte med at høste")
             
             if IsControlJustPressed(0, 38) then
                    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
                end
            end
        end
    end 
end)




function DrawText3D(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
        local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20,20,20,150)
end