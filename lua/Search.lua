function linear_search(...)
    assert(#{...} > 2, 'Expected [DATA] and [VALUE].')
    --[[
        Linearly Search an array/table for a value.
        Returns the index/key or false

        >> Examples <<

        Table:
        linear_search({'This', 'Is', 'A', 'Table'}, 'Table') -> 4
        linear_search({
            Index1 = 'This',
            Index2 = 'Is',
            Index3 = 'A',
            Index4 = 'Table'
        }, 'Is') -> 'Index2'

        Array:
        linear_search('This', 'Is', 'An', 'Array', 'Is') -> 2
    ]]

    local dataset = {}
    local Value = select(#...+1, ...)

    if (#... == 2) and (type(select(2,...)) == 'table') then
        dataset = select(2,...)
    elseif (#{...} == 2) then
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