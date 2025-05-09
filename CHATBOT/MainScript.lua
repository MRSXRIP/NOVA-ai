-- Require the other modules (Memory and AdvancedReasoning)
local memory = require(game.ServerScriptService.ChatBot.Memory)
local reasoning = require(game.ServerScriptService.ChatBot.AdvancedReasoning)
local utils = require(game.ServerScriptService.ChatBot.Utils)

local bot_name = "MinBot"
local bot_owner = "MinWasTaken"

local recognized = {}

-- Core Chatbot Logic
getgenv().current = game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(msgg)
    local msg = msgg.Message
    local plr = game.Players[msgg.FromSpeaker]
    
    -- Stop the bot if /chatbot stop is typed
    if msg:sub(1, 13) == "/chatbot stop" then
        current:Disconnect()
        return
    end
    
    -- Check if the player is too far
    if plr == game.Players.LocalPlayer or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    if (plr.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 30 then
        return
    end
    
    -- Respond to message
    if msg:sub(1, 6) == "/botin" then
        msg = msg:sub(8)
        
        -- Check if the player is recognized
        if not recognized[plr.Name] then
            local recognition_id = utils.createRecognitionId(game.Players.LocalPlayer.Name, plr.Name)
            memory.updateMemory(plr.Name, "recognized", recognition_id)
            recognized[plr.Name] = recognition_id
        end
        
        -- Send the message to be processed
        local reply = reasoning.getResponse(msg, recognized[plr.Name])
        utils.say(reply)
    end
end)
