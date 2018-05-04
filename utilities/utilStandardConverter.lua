-- Main function used when converting units to-and-from other units.
-- This does not work with units that are non-linear. Such will require custom functions in their own module file.
return function( _value, _valFrom, _valTo, _unitTable, _prefixTable )

	-- Ensure we even have a reason to run a conversion and save some time otherwise.
	if _valFrom ~= _valTo then

		-- Flag to ensure everything went right.
		local _isValid = false

		-- Convert our input into the default unit that the system is prepared to handle.
		for index, conversion in pairs( _unitTable ) do
			if string.upper( index ) == string.upper( string.sub( _valFrom, -#index ) ) then
				-- We assume it must have a prefix or be incorrect.
				if #index < #_valFrom then
					-- If this unit allows for prefixing, check for a match.
					if conversion[2] then
						if _prefixTable[ string.sub( _valFrom, 1, ( -#index ) - 1 ) ] ~= nil then
							_value = _value * conversion[1] * _prefixTable[ string.sub( _valFrom, 1, ( -#index ) - 1 ) ]
							_isValid = true
						else
							-- This isn't a prefix we know of.
							error( "Prefix of '" .. _valFrom .. "' is not recognized" )
						end
					else
						-- There's more here that we don't understand.
						error( "Expected '" .. _valFrom .. "' to be shorter" )
					end
				else
					_value = _value * conversion[1]
					_isValid = true
				end
				break
			end
		end
		
		if not _isValid then 
			-- We didn't find anything we recognize.
			error( "Unit '" .. _valFrom .. "' is not recognized" )
		end
		
		-- Second Segment -------------------------------------------------------------------------------------------------------
		
		-- Flag to ensure everything went right.
		_isValid = false

		-- Convert our input into the default unit that the computer is prepared to handle.
		for index, conversion in pairs( _unitTable ) do
			if string.upper( index ) == string.upper( string.sub( _valTo, -#index ) ) then
				-- We assume it must have a prefix or be incorrect.
				if #index < #_valTo then
					-- If this unit allows for prefixing, check for a match.
					if conversion[2] then
						if _prefixTable[ string.sub( _valTo, 1, ( -#index ) - 1 ) ] ~= nil then
							_value = _value / conversion[1] / _prefixTable[ string.sub( _valTo, 1, ( -#index ) - 1 ) ]
							_isValid = true
						else 
							-- This isn't a prefix we know of.
							error( "Prefix of '" .. _valTo .. "' is not recognized" )
						end
					else 
						-- There's more here that we don't understand.
						error( "Expected '" .. _valTo .. "' to be shorter" )
					end
				else
					_value = _value / conversion[1]
					_isValid = true
				end
				break
			end
		end
		
		if not _isValid then 
			-- We didn't find anything we recognize.
			error( "Unit '" .. _valTo .. "' is not recognized" )
		end

	end
		
	return _value

end