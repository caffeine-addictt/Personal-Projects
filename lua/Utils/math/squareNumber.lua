--[=[
    Interesting math behaviour for squaring numbers between 10-99 where the square can be calculated differently.

    General Formulae:
    Two-Digit Numbers can be expressed in 10x + y
    (10x + y)^2 = 100x^2 + y^2 + 2(10)xy
                = 100x^2 + y^2 + 10xy

    Tada~ now you have the number squared.
    This method is quite viable for easy and quick mental sums.
    
    @parameters
    Number <number/string> [Required]

    Returns squared number.
]=]

return function(Number)
    assert(type(Number) == 'number' or type(Number) == 'string', 'Expected Number, Got: '..type(Number))
    Number = tonumber(Number)
    
    if (math.floor(Number) == Number) and (10 <= Number) and (Number < 100) then
        local Stringified = {tonumber(tostring(Number):sub(1,1)), tonumber(tostring(Number):sub(2,2))} -- Split 12 to {1,2}

        return Stringified[1]^2*100 + Stringified[2]^2 + 20*Stringified[1]*Stringified[2]
    else
        return Number ^ 2
    end
end