local energyTables = {
	  j = { 1,		 true  }, -- Joule
	 Ws = { 1,		 true  }, -- Watt - Second
	 Wh = { 3600,	 true  }, -- Watt - Hour
	boe = { 6.1239,  false }, -- Barrel Of Oil Equivalent
	Btu = { 1054.5,  false }, -- British thermal unit
	cal = { 4.184,	 false }, -- Calorie
	Cal = { 4184,    false }, -- Kilo Calorie
	 eV = { 1.6e-19, false }  -- Electron Volt
}

local valueNametable = {
	j = "Joule", 
	Ws = "Watt second",
	Wh = "Watt hour", 
	boe = "Barrel of oil equivalent",
	Btu = "British thermal unit", 
	cal = "calorie",
	Cal = "Kilo calorie", 
	eV = "Electron volt"
}

return { energyTables, true, nil, valueNametable }
-- Most modules follow this same layout.