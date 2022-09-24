--[=[
    Interesting math behaviour for squaring numbers between 10-99 where the square can be calculated differently.

    General Formulae:
    XXXX is a 4-digit number.
    The digit in the tens place of the 2-digit number squared occupies the first 2 digits of the 4-digit number,
    as such with the digit in the ones place occupying the last 2 digits of the 4-digit number.
    Add the 4-digit number 20 * the first digit of the 2-digit number and the second digit of the 2-digit number.

    Tada~ now you have the number squared.
    This method is quite viable for easy and quick mental sums.

    Prerequisite knowledge needed:
    Squares of 1-9;
        1^2 = 1
        2^2 = 4
        3^2 = 9
        ...
    Cross multiples of 1-9;
        1*1, 1*2, 1*3...
        2*1, 2*2, 2*3...
        3*1, 3*2, 3*3...

    Steps:
    1. Split the 2-digit integer into a & b such that for 12, a = 1 and b = 2.
    2. Square a.
    3. Multiply a with 100 to have a occupy the first 2 digits of the 4-digit result.
    4. Square b.
    5. Add a and b together to form a 3 or 4 digit number, one which we'll call c
    6. Add 20ab to c, call it d.
    7. d is the 2-digit number squared!

    Examples:
    15^2 = 1^2 * 100 + 5^2 + 20(1)(5)
         = 0125 + 20(5)
         = 225

    76^2 = 7^2 * 100 + 6^2 + 20(7)(6)
         = 4936 + 20(42)
         = 5776

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