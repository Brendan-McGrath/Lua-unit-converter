# Lua Unit Converter 
*LUC* is a simple and small multi-module approach to converting between scientific, metric, and customary measurements of mass, distance, energy, time, power, volume, temperature, and luminosity.

### Usage -
*LUC* is used like any other module in lua 5.1+;
``` Lua
luc = require "Lua-unit-converter"

print( "32 Celsius is " .. luc.convertTemperature(32, "C", "F") .. " Fahrenheit")
print( "1 Megajoule is " .. luc.convertEnergy(1, "Mj", "Btu") .. " British thermal units"
```


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
- [ ] Handle compounded units ( such as kg/h -> lb/m or even W -> j/s )
- [ ] Handle variety of names for one unit, such as 'Kilogram', 'Kilo Gram', and 'KiLoGrAm' for 'kg'
- [ ] Collect usage statistics for reference
