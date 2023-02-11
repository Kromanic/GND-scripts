local QBCore = exports["qb-core"]:GetCoreObject()
local onDuty = false
local PlayerJob = {}


CreateThread(function()
    while true do
        Wait(1000)
        if PlayerJob.name == "gallery" then
            if not onDuty then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end
end)

-- update PlayerJob when player is loaded




RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = PlayerJob.onduty

end)


RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)

RegisterNetEvent("qb-gallery:DutyB")
AddEventHandler("qb-gallery:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

CreateThread(function()
    if Config.Blip then
        local gallery = AddBlipForCoord(vector3(Config.Blip['x'], Config.Blip['y'], Config.Blip['z']))
        SetBlipAsShortRange(gallery, true)
        SetBlipSprite(gallery, 617)
        SetBlipScale(gallery, 0.8)
        SetBlipDisplay(gallery, 4)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(Config.Blip)
        EndTextCommandSetBlipName(gallery)
    end
end)
---// Progress bars
RegisterNetEvent('gdn-illegaljob:sellItems', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('show_items', 'Selling Items from Inventory', Config.ProgBarSpeed, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@world_human_stand_impatient@male@no_sign@base',
        anim = 'base',
        flags = 16,
    }, {}, {}, function() 
        TriggerServerEvent('gdn-illegaljob:sellrolex')
        TriggerServerEvent('gdn-illegaljob:5ct-Gold-chain')
        ClearPedTasks(ped)
    end, function() 
        ClearPedTasks(ped)
    end)
end)
RegisterNetEvent('gdn-illegaljob:sellItems1', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('show_items', 'Selling Items from Inventory', Config.ProgBarSpeed, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@world_human_stand_impatient@male@no_sign@base',
        anim = 'base',
        flags = 16,
    }, {}, {}, function() 
        TriggerServerEvent('gdn-illegaljob:Goldchain')
        ClearPedTasks(ped)
    end, function() 
        ClearPedTasks(ped)
    end)
end)
RegisterNetEvent('gdn-illegaljob:sellItems2', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('show_items', 'Selling Items from Inventory', Config.ProgBarSpeed, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@world_human_stand_impatient@male@no_sign@base',
        anim = 'base',
        flags = 16,
    }, {}, {}, function() 
        TriggerServerEvent('gdn-illegaljob:Gems')
        ClearPedTasks(ped)
    end, function() 
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('gdn-illegaljob:pawnitems', function(item)
    local sellingItem = exports['qb-input']:ShowInput({
        header = Lang:t('info.title'),
        submitText = Lang:t('info.sell'),
        inputs = {
            {
                type = 'number',
                isRequired = false,
                name = 'amount',
                text = Lang:t('info.max', { value = item.amount })
            }
        }
    })
    if sellingItem then
        if not sellingItem.amount then
            return
        end

        if tonumber(sellingItem.amount) > 0 then
            TriggerServerEvent('gdn-illegaljob:server:sellitems', item.name, sellingItem.amount, item.price)
        else
            QBCore.Functions.Notify(Lang:t('error.negative'), 'error')
        end
    end
end)