local memory = loadstring(game:HttpGet("https://raw.githubusercontent.com/MRSXRIP/NOVA-ai/main/CHATBOT/Memory.lua"))()
local utils  = loadstring(game:HttpGet("https://raw.githubusercontent.com/MRSXRIP/NOVA-ai/main/CHATBOT/Utils.lua"))()

local brain = {}

function brain.process(input)
    local cleaned = utils.cleanText(input)
    
    if cleaned:find("hi") or cleaned:find("hello") then
        return "Hello! How can I help you?"
    elseif cleaned:find("who are you") then
        return "I'm Nova, your AI chatbot!"
    elseif cleaned:find("remember") then
        memory.remember("note", "You told me to remember something!")
        return "Okay! I remembered it."
    elseif cleaned:find("what did i say") then
        return memory.recall("note") or "I don't remember anything yet."
    else
        return "I'm not sure how to reply to that yet."
    end
end

return brain

