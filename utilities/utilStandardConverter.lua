-- File to hold the standard function for converting units.
-- This isn't a necessity but will help modularize the entire system later.

return function( _value, _valFrom, _valTo, _unitTable, _prefixTable )

	if _valFrom ~= _valTo then -- Ensure we even have a reason to run a conversion. Saves some time otherwise.

		local _isValid = false -- Flag to ensure everything went right.

		-- Convert our input into the default unit that the computer is prepared to handle.
		for index, conversion in pairs( _unitTable ) do
			if string.upper( index ) == string.upper( string.sub( _valFrom, -#index ) ) then
				if #index < #_valFrom then -- We assume it must have a prefix or be incorrect.
					if conversion[2] then -- If this unit allows for prefixing, check for a match.
						if _prefixTable[ string.sub( _valFrom, 1, ( -#index ) - 1 ) ] ~= nil then
							_value = _value * conversion[1] * _prefixTable[ string.sub( _valFrom, 1, ( -#index ) - 1 ) ]
							_isValid = true
						else -- This isn't a prefix we know of.
							error( "Prefix of '" .. _valFrom .. "' is not recognized" )
						end
					else -- There's more here that we don't understand.
						error( "Expected '" .. _valFrom .. "' to be shorter" )
					end
				else
					_value = _value * conversion[1]
					_isValid = true
				end
				break
			end
		end
		
		if not _isValid then -- We didn't find anything we recognize.
			error( "Unit '" .. _valFrom .. "' is not recognized" )
		end
		
		-- Second Segment -------------------------------------------------------------------------------------------------------
		
		_isValid = false -- Flag to ensure everything went right.

		-- Convert our input into the default unit that the computer is prepared to handle.
		for index, conversion in pairs( _unitTable ) do
			if string.upper( index ) == string.upper( string.sub( _valTo, -#index ) ) then
				if #index < #_valTo then -- We assume it must have a prefix or be incorrect.
					if conversion[2] then -- If this unit allows for prefixing, check for a match.
						if _prefixTable[ string.sub( _valTo, 1, ( -#index ) - 1 ) ] ~= nil then
							_value = _value / conversion[1] / _prefixTable[ string.sub( _valTo, 1, ( -#index ) - 1 ) ]
							_isValid = true
						else -- This isn't a prefix we know of.
							error( "Prefix of '" .. _valTo .. "' is not recognized" )
						end
					else -- There's more here that we don't understand.
						error( "Expected '" .. _valTo .. "' to be shorter" )
					end
				else
					_value = _value / conversion[1]
					_isValid = true
				end
				break
			end
		end
		
		if not _isValid then -- We didn't find anything we recognize.
			error( "Unit '" .. _valTo .. "' is not recognized" )
		end

	end
		
	return _value

end