

minetest.register_abm({
    label = "Viability Creep",
    nodenames = {"group:fe_plant_live"},
    neighbors = {},
    interval = 4,
    chance = 1,
	action = function(pos, node)
		local name = node.name
		if(name == "farming:log_paperbark" or name == "farming:log_cinnamon")then
			pos.y = pos.y - 1;
			local name = minetest.get_node(pos).name

			for _,v in pairs(old_expansion.growNodes)do -- Search for viable growth nodes underneath
				if(v == name)then
					name = "growth"
				else end
			end
			local meta = minetest.get_meta(pos)
			if(name == "growth" or meta:get_string("vstate") == "viable")then
				pos.y = pos.y + 1
				local meta = minetest.get_meta(pos)
				meta:set_string("vstate","viable")
			else end
		end
    end
})

--old_expansion.schems.schemATICS

local n1 = { name = "air"}
local n2 = { name = "farming:pod"}
local n3 = { name = "farming:leaves1" }
local n4 = { name = "farming:log_paperbark"}

old_expansion.schems.schem_poplar = {
	size = {
		y = 8,
		x = 5,
		z = 5
	}
,
	data = {
n1, n1, n1,
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n2, 
n1, n1, n1, 
n2, n3, n2, 
n1, n1, n3, 
n3, n3, n1, 
n1, n1, n3, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n2, n1, 
n1, n1, n2, 
n3, n2, n1, 
n2, n3, n3, 
n3, n2, n3, 
n3, n3, n3, 
n3, n1, n3, 
n3, n3, n1, 
n1, n1, n3, 
n1, n1, n1, 
n1, n4, n1, 
n1, n1, n1, 
n4, n1, n1, 
n1, n2, n4, 
n2, n1, n2, 
n3, n4, n3, 
n2, n3, n3, 
n3, n3, n3, 
n3, n3, n3, 
n3, n3, n3, 
n3, n3, n3, 
n3, n1, n3, 
n1, n3, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n2, n1, n1, 
n1, n2, n3, 
n2, n1, n2, 
n3, n3, n3, 
n2, n3, n3, 
n3, n3, n3, 
n1, n3, n3, 
n3, n1, n1, 
n1, n3, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n1, n1, n1, 
n2, n1, n1, 
n1, n2, n3, 
n2, n1, n1, 
n3, n3, n3, 
n1, n1, n1, 
n3, n1, n1, 
n1, n1, n1, 
n1, n1, 

}
}
minetest.register_schematic(old_expansion.schems.schem_poplar)



local n1 = { name = "air", prob = 0 }
local n2 = { name = "farming:pod" }
local n3 = { name = "farming:leaves1" }
local n4 = { name = "farming:log_paperbark" }
local n5 = { name = "farming:log_paperbark", param2 = 3 }
local n6 = { name = "farming:log_paperbark", param2 = 1 }
local n7 = { name = "farming:log_paperbark", param2 = 2 }

old_expansion.schems.schem_trop = {
	yslice_prob = {
		
	},
	size = {
		y = 8,
		x = 5,
		z = 5
	}
,
	data = {
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, 
n1, n2, n1, n1, n3, n2, n3, n1, n1, n1, n3, n3, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, 
n2, n1, n1, n1, n3, n3, n1, n1, n1, n1, n3, n4, n2, n1, n1, n3, n3, 
n3, n1, n1, n1, n2, n1, n1, n1, n1, n3, n1, n1, n1, n1, n5, n1, n1, 
n1, n1, n5, n1, n1, n1, n1, n5, n1, n1, n2, n6, n5, n2, n1, n3, n3, 
n7, n3, n1, n1, n3, n3, n3, n1, n1, n2, n3, n2, n1, n1, n3, n3, n3, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n2, n1, n1, n1, n3, 
n3, n1, n2, n1, n3, n3, n7, n3, n1, n1, n3, n3, n3, n1, n1, n1, n2, 
n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n2, n1, n2, n1, n1, n3, n2, n3, n1, n1, n3, 
n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
}
}
minetest.register_schematic(old_expansion.schems.schem_trop)

local n1 = { name = "air", prob = 0 }
local n2 = { name = "farming:pod" }
local n3 = { name = "farming:leaves1" }
local n4 = { name = "farming:log_paperbark", param2 = 3 }
local n5 = { name = "farming:log_paperbark", param2 = 2 }

old_expansion.schems.schem_conif = {
	yslice_prob = {
		
	},
	size = {
		y = 8,
		x = 5,
		z = 5
	}
,
	data = {
n1, n1, n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n3, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n2, n2, n1, n1, 
n3, n3, n3, n1, n1, n3, n3, n3, n1, n1, n1, n3, n1, n1, n1, n1, n3, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n4, n1, n1, 
n2, n2, n4, n2, n2, n3, n3, n4, n3, n3, n1, n3, n4, n3, n1, n1, n3, 
n5, n3, n1, n1, n3, n3, n3, n1, n1, n1, n3, n1, n1, n1, n1, n3, n1, 
n1, n1, n1, n1, n1, n1, n1, n2, n2, n2, n1, n1, n3, n3, n3, n1, n1, 
n3, n3, n3, n1, n1, n1, n3, n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n1, n1, 
n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
	}
}
minetest.register_schematic(old_expansion.schems.schem_conif)


local n1 = { name = "air", prob = 0 }
local n2 = { name = "farming:pod" }
local n3 = { name = "farming:leaves1" }
local n4 = { name = "farming:log_paperbark" }
local n5 = { name = "farming:log_paperbark", param2 = 3 }
local n6 = { name = "farming:log_paperbark", param2 = 1 }
local n7 = { name = "farming:log_paperbark", param2 = 2 }

old_expansion.schems.schem_will = {
	yslice_prob = {
		
	},
	size = {
		y = 8,
		x = 5,
		z = 5
	}
,
	data = {
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, 
n2, n2, n1, n1, n3, n3, n3, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n2, n1, n1, n1, n3, 
n3, n2, n1, n1, n1, n2, n3, n2, n2, n1, n3, n4, n3, n3, n1, n2, n3, 
n3, n1, n1, n3, n3, n1, n1, n1, n1, n3, n1, n1, n1, n1, n5, n1, n1, 
n1, n1, n5, n1, n1, n6, n6, n5, n1, n1, n3, n3, n5, n1, n1, n1, n3, 
n7, n4, n5, n2, n3, n7, n3, n3, n3, n3, n3, n2, n1, n1, n3, n3, n3, 
n1, n1, n1, n1, n1, n1, n2, n2, n1, n1, n1, n3, n3, n2, n1, n1, n1, 
n1, n3, n2, n2, n1, n2, n1, n3, n3, n1, n3, n7, n3, n1, n1, n1, n3, 
n3, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n1, n2, n1, n1, n3, 
n7, n3, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, 

}
}
minetest.register_schematic(old_expansion.schems.schem_will)
