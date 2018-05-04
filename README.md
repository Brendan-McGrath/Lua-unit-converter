# Lua Unit Converter 
*LUC* is a simple and small multi-module approach to converting between scientific, metric, and customary measurements of mass, distance, energy, time, power, volume, temperature, and luminosity.

### Usage -
*LUC* is easy to import and begin using with only a few lines of code;
``` Lua
luc = require "Lua-unit-converter"
luc.include("All") -- Includes all of the modules available. 
print( "32 Celsius is " .. luc.convertTemperature(32, "C", "F") .. " Fahrenheit")
print( "1 Megajoule is " .. luc.convertEnergy(1, "Mj", "Btu") .. " British thermal units"
```
To include any of the modules located in 'luaUnitConverter/modules' independantly, luc.include( "ModuleName" ) can be used. For example,
```
luc.include("Temperature") -- To allow for temperature conversions using 'luc.convertTemperature( ... )'
luc.include("Energy") -- To allow for temperature conversions using 'luc.convertEnergy( ... )'
```
All imported modules follow the same naming conventions, so all functions will look like 'luc.convertModuleName( ... )'
```
luc.include("Temperature")
print( "32 Celsius is " .. luc.convertTemperature(32, "C", "F") .. " Fahrenheit") 

luc.include("Energy")
print( "1 Megajoule is " .. luc.convertEnergy(1, "Mj", "Btu") .. " British thermal units"
```

### Available modules and units -

Energy
 - 'j'   Joule ( Supports SI prefixing, Gj Mj kj.. )
 - 'Ws'  Watt Second ( Supports SI prefixing, GWs MWs kWs.. )
 - 'Wh'  Watt Hour ( Supports SI prefixing, GWs MWs kWs.. )
 - 'Btu' British thermal units
 - 'cal' calorie
 - 'Cal' ( kilo ) Calorie
 - 'eV'  Electron volt
	
Power
 - 'W'  Watt ( Supports SI prefixing, GW MW kW.. )
 - 'hp' Horsepower

Temperature
 - 'K'  Kelvin
 - 'F'  Fahrenheit
 - 'C'  Celsius
 - 'R'  Rankine
 - 'Re' Reaumur
 - 'Ro' Romer
 - 'De' Delisle


### Todo -
 - [ ] Complete Sub-Modules
    - [ ] Mass
    - [ ] Distance
    - [X] Energy
    - [X] Power
		- [ ] Support for logarithmic values such as dBm and dBW
    - [ ] Time
    - [ ] Volume
    - [X] Temperature
    - [ ] Luminosity
- [ ] Allow requiring of individual sub-modules rather than requiring the whole package.
- [ ] Handle compounded units ( such as kg/h -> lb/m or even W -> j/s rather than js as an independant unit )
- [ ] Handle variety of names for one unit, such as 'Kilogram', 'Kilo Gram', and 'KiLoGrAm' for 'kg'
- [ ] Collect information regarding memory usage and cpu-time for determining performance
