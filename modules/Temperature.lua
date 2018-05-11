-- Temperature Conversion Tables (Kelvin Standard)

-- Temperature conversions are not as easily converted as other systems and require some unique handling.

-- Although using functions might produce a slight ammount more overhead than a table and value system; it should be negligable.

local tempToStandard = {
	 K = function( _val ) return _val 									end, -- Kelvin
	 F = function( _val ) return ( _val + 459.67 ) * ( 5 / 9 ) 			end, -- Fahrenheit
	 C = function( _val ) return _val + 273.15 							end, -- Celsius
	 R = function( _val ) return _val * ( 5 / 9 )						end, -- Rankine
	Re = function( _val ) return _val * ( 5 / 4 ) + 273.15				end, -- Reaumur
	Ro = function( _val ) return ( _val - 7.5 ) * ( 40 / 21 ) + 273.15	end, -- Romer
	De = function( _val ) return 373.15 - _val * ( 2 / 3 )				end  -- Delisle
}

local tempFrStandard = {
	 K = function( _val ) return _val 									end, -- Kelvin
	 F = function( _val ) return ( ( 9 / 5 ) * _val ) - 459.67 			end, -- Fahrenheit
	 C = function( _val ) return _val - 273.15 							end, -- Celsius
	 R = function( _val ) return _val * ( 9 / 5 )						end, -- Rankine
	Re = function( _val ) return ( _val - 273.15 ) * ( 4 / 5 )			end, -- Reaumur
	Ro = function( _val ) return ( _val - 273.15 ) * ( 21 / 40 ) + 7.5	end, -- Romer
	De = function( _val ) return ( 373.15 - _val ) * ( 3 / 2 )			end  -- Delisle
}

local valueNametable = {
	K = "Kelvin", 
	F = "Fahrenheit",
	C = "Celsius", 
	R = "Rankine",
	Re = "Reaumur", 
	Ro = "Romer",
	De = "Delisle"
}

local function convertTemperature( _value, _valFrom, _valTo ) -- convertTemperature

	local _isValid = false
	-- Converts the input value to Kelvin, to make conversion uniform and easier later on.
	for index, conversion in pairs( tempToStandard ) do
		if string.upper( index ) == string.upper( _valFrom ) then 	-- Convert both strings to uppercase as all temperature units are unique either way.
			_value = conversion( _value ) -- Convert to kelvin.
			_isValid = true -- Confirm that the value was received.
			break
		end
	end
	
	if not _isValid then
		error("Unit '" .. _valFrom .. "' is not recognized.")
	end
	
	_isValid = false
	-- Now to convert out to the chosen unit.
	for index, conversion in pairs( tempFrStandard ) do
		if string.upper( index ) == string.upper( _valTo ) then 	-- Convert both strings to uppercase as all temperature units are unique either way.
			_value = conversion( _value ) -- Convert out of kelvin.
			_isValid = true -- Confirm that the value was received.
			break
		end
	end

	if not _isValid then
		error("Unit '" .. _valTo .. "' is not recognized.")
	end
	
	return _value

end

return { nil, false, convertTemperature, valueNametable }
