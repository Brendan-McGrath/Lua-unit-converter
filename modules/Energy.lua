local energyTables = {
	  j = { 1,		 true  }, -- Joule
	 Ws = { 1,		 true  }, -- Watt - Second
	 Wh = { 3.6e3,	 true  }, -- Watt - Hour
	Btu = { 1055.06, false }, -- British thermal unit
	cal = { 4.184,	 false }, -- Calorie
	Cal = { 4.184e3, false }, -- Kilo Calorie
	 eV = { 1.6e-19, false }  -- Electron Volt
}

return { energyTables, true, nil }
-- Most modules follow this same layout.