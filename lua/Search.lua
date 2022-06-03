function Linear_Search(...)
    assert(#{...} > 2, 'Expected [DATA] and [VALUE].')

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