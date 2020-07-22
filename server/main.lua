ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Items = {
    'metalscrap',
    'plastic',
    'copper',
    'aluminium',
    'steel',
    'glass',
}

ESX.RegisterServerCallback('hasan:copCount', function(source, cb)
	local xPlayers = ESX.GetPlayers()

	copConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			copConnected = copConnected + 1
		end
	end

	cb(copConnected)
end)

RegisterNetEvent('td-atmrob:givemoney')
AddEventHandler('td-atmrob:givemoney', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(Config.Money)
end)

ESX.RegisterUsableItem('usefulusb', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('td-atmrob:client:start', source)
end)

RegisterNetEvent('td-atmrob:giveitem')
AddEventHandler('td-atmrob:giveitem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local Item = 'documents'

    xPlayer.addInventoryItem(Item,1)
end)

ESX.RegisterServerCallback("hasan:itemkontrol", function(source, cb, itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname)["count"]

    if item >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent("hasan:itemsil2")
AddEventHandler("hasan:itemsil2", function(itemname)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(itemname, count)
end)

RegisterServerEvent('hasan:itemver2')
AddEventHandler('hasan:itemver2', function(item, count)
    local player = ESX.GetPlayerFromId(source)
    player.addInventoryItem(item, count)
end)

