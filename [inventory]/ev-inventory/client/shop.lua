local texts = {}
local shopSecondaryInventory = {
    type = 'shop',
    owner = ''
}

Citizen.CreateThread(function()
    for k, v in pairs(Config.ExtraVisionShops) do
        if v.enableBlip then
            for val, coords in pairs(v.coords) do
                local blip = {
                    name = k,
                    coords = coords,
                    colour = v.blipColour or 3,
                    scale = v.blipScale or 0.65,
                    sprite = v.blipSprite or 52
                }
                TriggerEvent('disc-base:registerBlip', blip)
            end
        end
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.ExtraVisionShops) do
        if v.weaponBlip then
            for val, coords in pairs(v.coords) do
                local blip = {
                    name = k,
                    coords = coords,
                    colour = v.blipColour or 1,
                    scale = v.blipScale or 0.65,
                    sprite = v.blipSprite or 110
                }
                TriggerEvent('disc-base:registerBlip', blip)
            end
        end
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.ExtraVisionShops) do
        if v.PhoneShopBlip then
            for val, coords in pairs(v.coords) do
                local blip = {
                    name = k,
                    coords = coords,
                    colour = v.blipColour or 60,
                    scale = v.blipScale or 0.65,
                    sprite = v.blipSprite or 459
                }
                TriggerEvent('disc-base:registerBlip', blip)
            end
        end
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.ExtraVisionShops) do
        if v.PawnShopBlip then
            for val, coords in pairs(v.coords) do
                local blip = {
                    name = k,
                    coords = coords,
                    colour = v.blipColour or 5,
                    scale = v.blipScale or 0.65,
                    sprite = v.blipSprite or 52
                }
                TriggerEvent('disc-base:registerBlip', blip)
            end
        end
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.ExtraVisionShops) do
        if v.courtBlip then
            for val, coords in pairs(v.coords) do
                local blip = {
                    name = k,
                    coords = coords,
                    colour = v.blipColour or 5,
                    scale = v.blipScale or 0.65,
                    sprite = v.blipSprite or 58
                }
                TriggerEvent('disc-base:registerBlip', blip)
            end
        end
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.ExtraVisionShops) do
        if v.starbucksBlip then
            for val, coords in pairs(v.coords) do
                local blip = {
                    name = k,
                    coords = coords,
                    colour = v.blipColour or 2,
                    scale = v.blipScale or 0.65,
                    sprite = v.blipSprite or 439
                }
                TriggerEvent('disc-base:registerBlip', blip)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while not ESXLoaded do
        Citizen.Wait(10)
    end
    for k, v in pairs(Config.ExtraVisionShops) do
        for val, coords in pairs(v.coords) do
            local marker = {
                name = k .. val,
                coords = coords,
                type = v.markerType or 1,
                colour = v.markerColour or { r = 55, b = 255, g = 55 },
                size = v.size or vector3(1.0, 1.0, 1.0),
                action = function()
                    shopSecondaryInventory.owner = k
                    openInventory(shopSecondaryInventory)
                end,
                shouldDraw = function()
                    return ESX.PlayerData.job.name == v.job or v.job == 'all'
                end,
                msg = v.msg or _U('keyshop'),
                show3D = v.show3D or false,
            }
            TriggerEvent('disc-base:registerMarker', marker)
        end
    end
end)

RegisterNetEvent('ev-inventory:shop')
AddEventHandler('ev-inventory:shop', function(ow)
    local Shop = { type = 'shop', owner = ow }
    openInventory(Shop)
end)
