local luaUnitConverter = {}

do

	local utilSIPrefixes = require "utilities.utilSiPrefixes"
	local standardConverter = require "utilities.utilStandardConverter"

	local allModules = {
		"Temperature",
		"Energy",
		"Power"
	}

	luaUnitConverter["include"] = function( _module ) -- Allow users to include specific modules in their code.

		if string.upper( _module ) == "ALL" then
			_module = allModules
		else
			_module = { _module }
		end

		for k, subModule in pairs( _module ) do
			local _moduledata = require ( "modules." .. subModule ) -- Info table ( or nil ), Uses default conversion function ( or false ), cutom function ( or nil )
			
			if _moduledata[2] then
				luaUnitConverter["convert" .. subModule] = function( _value, _valFrom, _valTo )
					return standardConverter( _value, _valFrom, _valTo, _moduledata[1], utilSIPrefixes ) end
			else
				luaUnitConverter["convert" .. subModule] = function( _value, _valFrom, _valTo )
					return _moduledata[3]( _value, _valFrom, _valTo, utilSIPrefixes ) end
			end
		end
		
	end

end
	
return luaUnitConverter