RegisterCommand("animfix", function(source, args, rawCommand)
    local ped = PlayerPedId()
    local isDead = false

    if not IsEntityInAir(ped) then
        if not IsPedRagdoll(ped) then
            if not IsPedInAnyVehicle(ped) then
                ClearPedTasksImmediately(ped)
                ClearPedSecondaryTask(ped)
                SetPedCanPlayGestureAnims(ped, true)
            else
                exports['QBCore:Notify']:SendAlert('inform', 'Bu komutu sadece araç dışında olduğunda kullanabilirsin.', 6500)
            end
        else
            exports['QBCore:Notify']:SendAlert('inform', 'Bu komutu sadece ayaktayken kullanabilirsin.', 6500)
        end
    else
        exports['QBCore:Notify']:SendAlert('inform', 'Bu komutu sadece yerdeyken kullanabilirsin.', 6500)
    end

end, false)

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/animfix', 'Eğer animasyonunuz bugda kalırsa ve /e c çalışmıyorsa bu komut kesinlikle animasyonu iptal edecektir.')
end)

------------------------------------------------------------------------------------------------------

RegisterCommand("discord", function()
    msg("Buraya Discord Adresinizi Girersiniz")
end, false)

function msg(text)
    TriggerEvent("QBCore:Notify", "[System]", {255, 0, 0,}, text)
end
