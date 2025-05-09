local function say(msg)
    -- Send the message to the game chat
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

local function createRecognitionId(player1, player2)
    -- Generate a unique ID based on player names
    return ((player1)..(player2)):lower()
end

return {
    say = say,
    createRecognitionId = createRecognitionId
}
