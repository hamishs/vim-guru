local openai = require("openai")
local M = {}

function M.get_query()
    local query = vim.fn.input("What can I help you with?")
    if query == "" then
        return nil
    end
    print("\n")
    return query
end

local BASE_PROMPT = [[You are an AI assistant that helps neovim users with
their questions. You should suggest helpful commands to help them accomplish
their task. Try to be as concise as possible.]]

function M.get_answer(query)
    local client = openai.new(os.getenv("OPENAI_API_KEY"))
    local status, response = client:chat({
        {role = "system", content = BASE_PROMPT},
        {role = "user", content = query}
    }, {
        model = "gpt-3.5-turbo",
        temperature = 0.5
    })

    if status == 200 then
        -- the JSON response is automatically parsed into a Lua object
        return response.choices[1].message.content
    end

    return nil
end

function M.run()
    local query = M.get_query()
    if query == nil then
        return
    end

    local answer = M.get_answer(query)
    if answer == nil then
        print("Failed to get answer")
        return
    end

    print(answer)
end




return M
