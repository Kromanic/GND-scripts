local QBCore = exports["qb-core"]:GetCoreObject()
local onDuty = false
local PlayerJob = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "gallery" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
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