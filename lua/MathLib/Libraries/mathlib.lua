local Module = {}
local errorLib = require('Libraries.error')

--[[
	@about
	Addition of An Arry of Numbers

	@param
	... <number(s)/array>

	@return
	Number

	@usecase
	Module:add(1,2,3,4,5) -> 15
]]
function Module:add(...)
	local finalNumber = 0
	
	for _, number in next, {...} do
		if type(number) == 'number' then
			finalNumber = finalNumber + number
		else
			errorLib(
				'Invalid Argument, SKipping {' .. tostring(number) .. '}',
				'',
				'Excepted: {NUMBER}',
				'GOT: {' .. tostring(type(number)) .. '}'
			)
		end
	end

	return finalNumber
end

--[[
	@about
	Multiplication of An Arry of Numbers

	@param
	... <number(s)/array>

	@return
	Number

	@usecase
	Module:multiply(1,2,3,4,5) -> 95
]]
function Module:multiply(...)
	local finalNumber = 0

	for _, number in next, {...} do
		if type(number) == 'number' then
			finalNumber = finalNumber * number
		else
			errorLib(
				'Invalid Argument, SKipping {' .. tostring(number) .. '}',
				'',
				'Excepted: {NUMBER}',
				'GOT: {' .. tostring(type(number)) .. '}'
			)
		end
	end

	return finalNumber
end

--[[
	@about
	Subtract Number1 by Number2

	@param
	From <Number> [Required]
	By <Number> [Required]

	@return
	Number

	@usecase
	Module:subtract(2,1) -> 1
]]
function Module:subtract(From, By)
	assert(type(From) == 'number', 'Expected Number, Got'..type(From))
	assert(type(By) == 'number', 'Expected Number, Got'..type(By))

	return (From - By)
end

--[[
	@about
	Assertain if number is a prime number

	@param
	num <Number> [Required]

	@return
	Bool

	@usecase
	Module:isprime(2) -> true
	Module:isprime(4) -> false
]]
function Module:isprime(num)
	assert(type(num)=='number','Expected Number! Got: '..type(num))

	if not self:isinteger(num) then -- number is not an integer
		return false
	end
	if num <= 1 then -- number is not positive
		return false
	end
	
	for i = 1, num - 1 do
		if num % i == 0 and i ~= 1 then
			return false
		end
	end
	return true
end

--[[
	@about
	Assertain if number is an integer

	@param
	num <Number> [Required]

	@return
	Bool

	@usecase
	Module:isinteger(4) -> true
	Module:isinteger(3.4) -> false
]]
function Module:isinteger(num)
	assert(type(num) == 'number', 'Excepted Number, Got [' .. type(num) .. ']')
	return (math.floor(num) == num)
end

--[[
	@about
	Strip a number to it's prime factors

	@param
	num <integer> [Required]

	@return
	Table = {PrimeFactor = Power}

	@usecase
	Module:primeify(2) -> {'2' = 1}
	Module:primeify(20) -> {'2' = 2, '5' = 1}
]]
function Module:primeify(num)
	assert(type(num)=='number','Expected Number! Got: '..type(num))
	assert(math.floor(num) == num, 'Expected integer! Got: '..num)

	local primeFactors = {}
	local CurrentNumber = num

	if num <= 1 then
		return primeFactors
	end
	for i = 2, num do
		if self:isprime(i) then
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

return setmetatable({},{
	__index = function(self, value)
		value = value:lower()
		if rawget(self, value) then
			return rawget(self, value)
		elseif Module[value] then
			return function(...)
				if select(1, ...) == self then
					return Module[value](...)
				else
					return Module[value](Module, ...)
				end
			end
		end
	end
})