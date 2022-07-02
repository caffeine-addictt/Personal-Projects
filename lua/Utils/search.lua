---@diagnostic disable: unused-local
local Search = {}

--[=[
    @Description
    Linearly Search an array/table for a value.
    Returns the index/key or false

    @Params
    1. Data <Array/Table> [Required] : To search within
    2. Value <Any> [Required]: To search for

    @Use Case
    1. linear_search({'This', 'Is', 'A', 'Table'}, 'Table') -> 4
    2. linear_search({
        Index1 = 'This',
        Index2 = 'Is',
        Index3 = 'A',
        Index4 = 'Table'
    }, 'Is') -> 'Index2'
    3. linear_search('This', 'Is', 'An', 'Array', 'Is') -> 2
]=]
function Search.linear_search(...)
    assert(#{...} > 2, 'Expected [DATA] and [VALUE].')

    local dataset = {}
    local Value = select(#...+1, ...)

    if (#... == 2) and (type(select(2,...)) == 'table') then
        dataset = select(2,...)
    elseif #{...} == 2 then
        assert(false, 'Invalid Data Structure!')
    else
        dataset = {...}
        dataset[#...+1] = nil
    end

    for i, v in next, dataset do
        if v == Value then
            return i
        end
    end

    return false
end