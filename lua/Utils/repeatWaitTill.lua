--[=[
    File Type: Module Script / Library
    About:
        An alternative to repeat loops like:
            repeat run() until check()
            callback()
        By utilizing the fact that returning a coroutine.yield() of a running thread yields, we can yield without a repeat loop.

    @parameters
    checkFunction - <Function> [Required]
    PassCondition - <Any> [Required]
    Callback - <Function> [Optional]
    Yielding - <Boolean> [Optional]

    Returns what checkFunction returns
]=]
local task, game
local RunService = game:GetService('RunService')

local err = "Poor Argument!\nParameter %s\nExpected: %s\nGot: %s"
local queue = {}
RunService.Stepped:Connect(function()
    for i, v in next, queue do
        local value = v.Check()
        if value == v.Condition then
            v.Pass(value)
            table.remove(queue, i)
        end
    end
end)


return function(checkFunction, PassCondition, Callback, Yielding)
    assert(type(checkFunction) == "function", err:format('checkFunction','function', type(checkFunction)))
    assert(not Callback or type(Callback) == "function", err:format('Callback','function', type(Callback)))
    assert(not Yielding or type(Yielding) == "boolean", err:format('Callback','boolean', type(Yielding)))
    
    local thread = (Yielding and coroutine.running())
    table.insert(queue, {
        Condition = PassCondition,
        Check = checkFunction,
        Pass = function(returned)
            if thread then
                task.spawn(thread, returned)
            end
            if Callback then
                Callback()
            end
        end
    })

    return (Yielding and coroutine.yield(thread))
end