 --[[
	'Lua Unit Converter' is a simple sub-module based approach to unit conversions in Lua.
    Copyright (C) 2018  Brendan McGrath

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

-- Get relative location of files.
local _Name = ...

-- The main bit of code.
local luaUnitConverter = {}

-- Akeep everything local and let GC handle keeping memory consumption low.
do

	-- Utilities that the main file uses. Keeps things tidy and simple.
	local utilSIPrefixes = require ( _Name .. ".utilities.utilSIPrefixes" )
	local standardConverter = require ( _Name .. ".utilities.utilStandardConverter" )

	-- List of all the known modules. Has to be manually entered as lua is unable to search a folder without an external library.
	local allModules = {
		"Temperature",
		"Energy",
		"Power"
	}

	-- Allow users to include all or specific modules in their code.
	luaUnitConverter["include"] = function( _module )

		if string.upper( _module ) == "ALL" then
			-- Sets the modules to be loaded / converted to match the list of known modules above.
			_module = allModules
		else
			-- Far easier to consider a single module as a list of modules to be converted by the function below.
			_module = { _module }
		end

		for k, subModule in pairs( _module ) do
			local _moduledata = require ( _Name .. "modules." .. subModule ) -- Info table ( or nil ), Uses default conversion function ( or false ), cutom function ( or nil )
			
			if _moduledata[2] then
				-- Applies the default conversion method ( utilities.utilStandardConverter ) to the modules data-tables.
				luaUnitConverter["convert" .. subModule] = function( _value, _valFrom, _valTo )
					return standardConverter( _value, _valFrom, _valTo, _moduledata[1], utilSIPrefixes ) end
			else
				-- Applies the custome conversion method supplied to the module and bypasses accessing data-tables.
				luaUnitConverter["convert" .. subModule] = function( _value, _valFrom, _valTo )
					return _moduledata[3]( _value, _valFrom, _valTo, utilSIPrefixes ) end
			end
		end
		
	end

end
	
-- Init is all done!
return luaUnitConverter