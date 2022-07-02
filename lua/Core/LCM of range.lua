--[=[
    Finds the Lowest Common Multiple (LCM) of a range of numbers.

    About:
        Uses the method of finding the highest powers of the combined Prime numbers then multiplying them.
            Example: LCM of 40, 84
            40 = 2^3 * 5
            84 = 2^2 * 3 * 7

            LCM = 2^3 * 3 * 5 * 7
                = 840

        First we calculate the Prime factors of all the numbers from N-min to N-max that are larger than 1.
        Next we compile all the highest powers.
        Lastly we multiply them together.

    @parameters
    ... <Array - Numbers> [Required]

    @use case
    LCM(1, 4) -> LCM of 2-4
    LCM(1, 2, 4, 6) -> LCM of 2-6
    LCM(5, 4, 8) -> LCM of 4-8

    Returns LCM of the provided 2 extremities.
]=]
local Primeify = require('Personal-Projects/lua/Utils/math/primeify')
local RoundNumber = require('Personal-Projects/lua/Utils/math/roundNumber')
return function(...)
    assert(#{...}~=0, 'Invalid range of numbers')

    local start = os.clock()
    local FinalNumber;
    local PrimeFactors = {}
    local min, max = math.min(...), math.max(...)

    if min <= 0 then
        return false
    elseif min == 1 then
        min = 2
    end

    if min == max then
        PrimeFactors = Primeify:primeify(min)
    else
        for num = min, max, 1 do
            for Number, Power in next, Primeify:primeify(num) do
                PrimeFactors[tostring(Number)] = PrimeFactors[tostring(Number)] or 0
                if PrimeFactors[tostring(Number)] < Power then
                    PrimeFactors[tostring(Number)] = Power
                end
            end
        end
    end

    for i,v in next, PrimeFactors do
        i,v = tonumber(i), tonumber(v)
        if v > 0 then
            FinalNumber = (FinalNumber and FinalNumber * i^v) or i^v
        end
    end

    print('Elapsed Time: ' .. RoundNumber((os.clock()-start)*1000,10) .. 'ms')
    return FinalNumber
end