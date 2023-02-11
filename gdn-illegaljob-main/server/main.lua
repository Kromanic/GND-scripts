local QBCore = exports['qb-core']:GetCoreObject()

-- --// Watches serverside
-- RegisterNetEvent("gdn-illegaljob:sellrolex", function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local hasItem = nil
--     for k, v in pairs(Config.Watches) do
--         local name = v.itemName
--         local money = math.random(v.MinSellPrice,v.MaxSellPrice)
--         if Player.Functions.GetItemByName(name) ~= nil then
--             hasItem = true
--             local amt = Player.Functions.GetItemByName(name).amount
--             local pay = money * amt
--             Player.Functions.AddMoney('cash', pay)
--             Player.Functions.RemoveItem(name, amt)
--         end
--     end
--     if hasItem then
--         TriggerClientEvent('QBCore:Notify', src, 'You have Sold Some Watches', 'success')
--     end
--     if not hasItem then
--         TriggerClientEvent('QBCore:Notify', src, 'you dont have anything to sell', 'error')
--     end 
-- end)
-- ---// chain Serverside
-- RegisterNetEvent("gdn-illegaljob:Goldchain", function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local hasItem = nil
--     for k, v in pairs(Config.Chain) do
--         local name = v.itemName
--         local money = math.random(v.MinSellPrice,v.MaxSellPrice)
--         if Player.Functions.GetItemByName(name) ~= nil then
--             hasItem = true
--             local amt = Player.Functions.GetItemByName(name).amount
--             local pay = money * amt
--             Player.Functions.AddMoney('cash', pay)
--             Player.Functions.RemoveItem(name, amt)
--         end
--     end
--     if hasItem then
--         TriggerClientEvent('QBCore:Notify', src, 'You have Sold Some Gold Chains', 'success')
--     end
--     if not hasItem then
--         TriggerClientEvent('QBCore:Notify', src, 'you dont have anything to sell', 'error')
--     end 
-- end)
-- ---/// Gem ServerSide
-- RegisterNetEvent("gdn-illegaljob:Gems", function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local hasItem = nil
--     for k, v in pairs(Config.Gems) do
--         local name = v.itemName
--         local money = math.random(v.MinSellPrice,v.MaxSellPrice)
--         if Player.Functions.GetItemByName(name) ~= nil then
--             hasItem = true
--             local amt = Player.Functions.GetItemByName(name).amount
--             local pay = money * amt
--             Player.Functions.AddMoney('cash', pay)
--             Player.Functions.RemoveItem(name, amt)
--         end
--     end
--     if hasItem then
--         TriggerClientEvent('QBCore:Notify', src, 'You have Sold Some Value Gems', 'success')
--     end
--     if not hasItem then
--         TriggerClientEvent('QBCore:Notify', src, 'you dont have anything to sell', 'error')
--     end 
-- end)
-- --// Ring enchants server side for crafting
-- QBCore.Functions.CreateCallback('gdn-illegaljob:rubyring:crafting', function(source, cb)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local metalscrap = Player.Functions.GetItemByName("metalscrap")
--     local iron = Player.Functions.GetItemByName("iron")
--     local rubber = Player.Functions.GetItemByName("rubber")
--     if metalscrap ~= nil and iron ~= nil and rubber ~= nil then
--         cb(true)
--     else
--         cb(false)
--     end
-- end)
----------------------------

RegisterNetEvent('gdn-illegaljob:server:sellitems', function(itemName, itemAmount, itemPrice)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalPrice = (tonumber(itemAmount) * itemPrice)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local dist
    for _, value in pairs(Config.PawnLocation) do
        dist = #(playerCoords - value.coords)
        if #(playerCoords - value.coords) < 2 then
            dist = #(playerCoords - value.coords)
            break
        end
    end
    if Player.Functions.RemoveItem(itemName, tonumber(itemAmount)) then
        if Config.BankMoney then
            Player.Functions.AddMoney('bank', totalPrice)
        else
            Player.Functions.AddMoney('cash', totalPrice)
        end
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.sold', { value = tonumber(itemAmount), value2 = QBCore.Shared.Items[itemName].label, value3 = totalPrice }),'success')
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_items'), 'error')
    end
end)