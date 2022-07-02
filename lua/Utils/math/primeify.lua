local Module = {}

--[=[
    Checks for Prime number.
    
    About:
        For 1 to n where n is the parsed integer larger than 1, we check if it is a factor of n.
        if so n is further divisible and is therefore not a prime.

    @parameters
    num <integer> [Required]

    Returns Boolean
]=]
function Module:isPrime(num)
    assert(type(num)=='number','Expected Number! Got: '..type(num))

    if math.floor(num) ~= num then -- number is not an integer
        return false
    end
    if num <= 1 then -- number is not positive
        return false
    end
    local numFactor = 0
    for i = 1, num do
      if num % i == 0 then
        numFactor = numFactor + 1
      end
      if numFactor > 2 then
        return false
      end
    end
    return true
end

--[=[
    Strips numbers to it's prime factors.
    
    About:
        Codification of the elementary method of finding Prime Factors.
        For example, 30.
            30
            15 2
            5  3
            1  5
            2*3*5 = 30
    
    @parameters
    num <integer> [Required]

    Returns table {Factor = Power}
]=]
function Module:primeify(num)
    assert(type(num)=='number','Expected Number! Got: '..type(num))
    assert(math.floor(num) == num, 'Expected integer! Got: '..num)

    local primeFactors = {}
    local CurrentNumber = num

    if num <= 1 then
        return primeFactors
    end
    for i = 2, num do
        if self:isPrime(i) then
            if CurrentNumber == 1 then
                break
            end
            primeFactors[tostring(i)] = primeFactors[tostring(i)] or 0
            while (CurrentNumber%i) == 0 do
                CurrentNumber = CurrentNumber / i
                primeFactors[tostring(i)] = primeFactors[tostring(i)] + 1
            end
        end
    end
    return primeFactors
end

return Module