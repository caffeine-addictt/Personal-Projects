local err

function err(...)
	local errorString = '///WARNING///'
	for _, str in next, {...} do
		if type(str) ~= 'string' then
			return err(
				'Invalid Arguments for {error.lua}',
				'',
				'EXPECTED: {STRING}',
				'GOT: {' .. type(str) .. '}'
			)
		end

		errorString = errorString .. '\n' .. str
	end

	print(errorString)
end

return err