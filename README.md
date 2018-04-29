# Lua Unit Converter 
*LUC* is a simple and small multi-module approach to converting between scientific, metric, and customary measurements of mass, distance, energy, time, power, volume, temperature, and luminosity.

### Usage -
*LUC* is used like any other module in lua 5.1+;
```
luc = require "Lua-unit-converter"

print( "32 Celsius is " .. luc.convertTemperature(32, "C", "F") .. " Fahrenheit")
print( "1 Megajoule is " .. luc.convertEnergy(1, "Mj", "Btu") .. " British thermal units"

```

If you're only interested in a single sub-module, you can treat it as returning a fuction, rather than a table,
```
convertTemperature = require "Lua-unit-converter.lucTemperature"

print( "32 Fahrenheit is " .. luaUnitConverter.convertTemperature(32, "F", "R") .. " Rankine"
```


### Todo -
 - [ ] Complete Sub-Modules
    - [ ] Mass
    - [ ] Distance
    - [X] Energy
    - [ ] Power
    - [ ] Time
    - [ ] Volume
    - [X] Temperature
    - [ ] Luminosity
- [ ] Handle compounded units ( such as kg/h -> lb/m )
- [ ] Handle variety of names for one unit, such as 'Kilogram', 'Kilo Gram', and 'KiLoGrAm' for 'kg'
