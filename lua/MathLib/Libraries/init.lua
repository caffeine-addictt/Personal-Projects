local Cache = {}
local Init = {}
local LibDir = 'Libraries'
local errorLib = require('Libraries.error')
local DefaultLibs = {
	'mathLib',
}

function Init:fetch(LibName)
	if Cache[LibName:lower()] then
		errorLib(
			'Duplicate Libraries [' .. LibName .. ']',
			'Overwriting previous cache'
		)
	end

	local Success, Fetched = pcall(require, LibDir .. '.' .. LibName)
	if Success and type(Fetched) == 'table' then
		Cache[LibName:lower()] = Fetched
		return Cache[LibName:lower()]
	elseif Success and type(Fetched) ~= 'table' then
		errorLib(
			'Invalid Library Type',
			'',
			'Excepted: {TABLE}',
			'GOT: {' .. type(Fetched) .. '}'
		)
	else
		errorLib(
			'Failed to fetch library [' .. LibName .. ']',
			'',
			tostring(Fetched)
		)
	end
end

function Init:uncache(LibName)
	if Cache[LibName] then
		Cache[LibName] = nil
		return true
	else
		errorLib('Unable to UnCache UnCached Library [' .. LibName .. ']')
	end
end

for _, LibName in next, DefaultLibs do
	pcall(Init.fetch, Init, LibName)
end

return setmetatable({},{
	__index = function(self, value)
		value = value:lower()
		if rawget(self, value) then
			return rawget(self, value)
		elseif Init[value] then
			return function(...)
				if select(1, ...) == self then
					return Init[value](...)
				else
					return Init[value](math, ...)
				end
			end
		elseif Cache[value] then
			return Cache[value]
		end
	end
})