 --[[
    'Lua Unit Converter' is a simple sub-module based approach to unit conversions in Lua.
    Copyright (C) 2018  Brendan McGrath

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

-- Get relative location of files.
local _Name = ...

-- The main bit of code.
local luaUnitConverter = {}

-- To handle names.
luaUnitConverter["includedUnits"] = {}

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
			local _moduledata = require ( _Name .. ".modules." .. subModule ) -- Info table ( or nil ), Uses default conversion function ( or false ), cutom function ( or nil )
			
			luaUnitConverter["includedUnits"][subModule] = _moduledata[4]
			
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
	
	-- Allow users to review a list of the units available in a specific module.
	luaUnitConverter["unitsOf"] = function( _module )
		
		if luaUnitConverter["includedUnits"][_module] ~= nil then
			return luaUnitConverter["includedUnits"][_module]
		else
			error( _module .. " has no unit-names table or is not loaded" )
		end
	
	end

end
	
-- Init is all done!
return luaUnitConverter
