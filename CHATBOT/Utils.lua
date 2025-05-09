--// Utils Module

-- Say a message in chat
local function say(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

-- Generate a unique ID based on two player names
local function createRecognitionId(player1, player2)
    return ((player1)..(player2)):lower()
end

-- Clean message (lowercase and remove punctuation)
local function cleanMessage(msg)
    return msg:lower():gsub("%p", "")
end

-- Safely decode JSON
local function safeJSONDecode(str)
    local success, result = pcall(function()
        return game:GetService("HttpService"):JSONDecode(str)
    end)
    return success and result or nil
end

return {
    say = say,
    createRecognitionId = createRecognitionId,
    cleanMessage = cleanMessage,
    safeJSONDecode = safeJSONDecode
}
