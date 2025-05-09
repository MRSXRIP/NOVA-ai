-- Memory Storage
local memory = {}

-- Update memory with player info and chatbot responses
function updateMemory(playerName, key, value)
    if not memory[playerName] then
        memory[playerName] = {}
    end
    memory[playerName][key] = value
end

-- Get memory info for a player
function getMemory(playerName, key)
    if memory[playerName] and memory[playerName][key] then
        return memory[playerName][key]
    else
        return nil
    end
end

return {
    updateMemory = updateMemory,
    getMemory = getMemory
}
