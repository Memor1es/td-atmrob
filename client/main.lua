ESX                           = nil

local startrob = false 
local dosyaprop = false
local hsn = 0
Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5)
    end

end)



local doktousb = {
    {x = -1056.88 , y = -233.17, z = 44.02}
}

local start = {
    {x = 1268.49 , y = -1710.37, z = 54.77}
}

local dosya = {
    {x = 1274.34 , y = -1713.73, z = 54.77, isOpen = false}
}

local lester = {
    {x = 1275.72 , y = -1710.29, z = 55.10}
}



--[[Citizen.CreateThread(function()
    for k,v in pairs(Config.npc) do
        local ped_hash = -1248528957
        RequestModel(ped_hash)
        while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
        end
        ped = CreatePed(1, ped_hash, v.coords, v.heading, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)   
    end
end)]]






function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.0002+ factor, 0.025, 0, 0, 0, 50)
end 

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local playerPed = GetPlayerPed(-1)
        local coords, shn  = GetEntityCoords(PlayerPedId()), true
        for k,v in pairs(start) do
            if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1 then 
                DrawText3Ds(v.x, v.y, v.z+0.50, "[E] Bilgisayarı Hackle")
                if IsControlJustReleased(0,119) then
                  if not startrob then
                    if GetCurrentResourceName() == 'td-atmrob' then
                        exports["aex-bar"]:taskBar(5000, "Hackleniyor! ")
                        exports['mythic_notify']:SendAlert("inform", "Dökümanları Al!")
                           startrob = true
					else
						TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Kanki scriptin ismini neden değiştiriyosun amskdklamsd!'})
					end
                else
                    exports['mythic_notify']:SendAlert("inform", "Şuan bunu yapamazsın!")     
                 end
             else
         end
     end
 end

 if startrob then    
 for a,b in pairs(dosya) do
         if GetDistanceBetweenCoords(coords, b.x, b.y, b.z, true) < 1 then 
             DrawText3Ds(b.x, b.y, b.z+0.50, "[E] Dosyaları Al ")
             if IsControlJustReleased(0,119) then
                exports["aex-bar"]:taskBar(5000, "Dosyalar Alınıyor! ")
TriggerEvent('td-atmrob:toggle:file')
TriggerServerEvent('td-atmrob:giveitem')
startrob = false
                  ClearPedTasks(PlayerPedId()) 
                 -- b-.isOpen = true
                  --hsn = hsn
                --  if hsn31 == Config.Standalone then 
                  --   b.isOpen = false
                  --   hsn = 0  
                 --end
             end
         end
     end
 end 
 end
end)

RegisterNetEvent('td-atmrob:toggle:file')
AddEventHandler('td-atmrob:toggle:file', function()
    local player = PlayerPedId()
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        GiveWeaponToPed(player, 0x88C78EB7, 1, false, true);
    end
end)

RegisterNetEvent('td-atmrob:toggle:filedo')
AddEventHandler('td-atmrob:toggle:filedo', function()
    local player = PlayerPedId()
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        --GiveWeaponToPed(player, 0x88C78EB7, 1, false, true);
        RemoveWeaponFromPed(player, 0x88C78EB7)
    end
end)


function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
     Citizen.Wait(5)
    end
   end



Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local playerPed = GetPlayerPed(-1)
        local coords, shn  = GetEntityCoords(PlayerPedId()), true
        for k,v in pairs(doktousb) do
            if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1 then 
                DrawText3Ds(v.x, v.y, v.z+0.50, "[E] Dök. USB\'ye Cevir")
                if IsControlJustReleased(0,119) then
                    ESX.TriggerServerCallback("hasan:itemkontrol", function(var)
                        if var then
                            loadAnimDict( "mini@repair" ) 
				TaskPlayAnim( PlayerPedId(), "mini@repair", "fixing_a_ped", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
                            exports["aex-bar"]:taskBar(4000, "Dosyalar çevriliyor!")
                            TriggerServerEvent("hasan:itemver2", "usefulusb")
                            TriggerServerEvent("hasan:itemsil2", "documents") 
                            TriggerEvent('td-atmrob:toggle:filedo')
                        elseif not var then
                            exports['mythic_notify']:SendAlert("inform", "Dökümanların Yok!")
                        end
                    end, "documents")  				
             else
         end
     end
 end
end
end)

RegisterNetEvent('td-atmrob:client:start')
AddEventHandler('td-atmrob:client:start', function()
    local entity, distance = ESX.Game.GetClosestObject({
        'prop_fleeca_atm',
    })
    if distance ~= -1 and distance <= 1.5 then
        if entity ~= nil then
        exports["aex-bar"]:taskBar(2500, "USB TAKILIYOR!")
        exports["aex-bar"]:taskBar(2500, "SISTEM HACKLENIYOR!")
        TriggerServerEvent('td-atmrob:givemoney')
        end
    else
        exports['mythic_notify']:SendAlert("inform", "Sadece Soygun İçin Kullanabilirsiniz!")  
    end
end)
























            




