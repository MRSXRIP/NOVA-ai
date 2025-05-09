local function getResponse(playerInput, recognition_id)
    -- Simple response system: you can expand this with more complex logic
    local responses = {
        ["hello"] = "Hi there! How can I assist you today?",
        ["how are you"] = "I'm doing great, thanks for asking! How about you?",
        ["bye"] = "Goodbye! See you soon."
    }
    
    -- Check if the message is recognized
    local response = responses[playerInput:lower()]
    if response then
        return response
    else
        return "I'm not sure how to respond to that."
    end
end

return {
    getResponse = getResponse
}
