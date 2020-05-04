

minetest.register_abm({
    label = "Fruit Pod Grow",
    nodenames = {"farming:pod","farming:pod2","farming:pod3"},
    neighbors = {"air"},
    interval = 7,
    chance = 0.5,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		if(meta:get_string("type") ~= "")then
			if(node.name == "farming:pod")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name="farming:pod2"})
				meta:set_string("type",type)
				old_expansion.particles_leafdrop(pos)
			elseif(node.name == "farming:pod2")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name="farming:pod3"})
				meta:set_string("type",type)
				old_expansion.particles_leafdrop(pos)
			elseif(node.name == "farming:pod3")then
				local type = meta:get_string("type")
				minetest.set_node(pos,{name = "farming:fruit_"..type})
				meta:set_string("type",type)
				old_expansion.particles_leafdrop(pos)
			else return 
			end
	else minetest.remove_node(pos) end

    end
})
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



-- Leafdecay
local function leafdecay_after_destruct(pos, oldnode, def)
	for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, def.radius),
			vector.add(pos, def.radius), def.leaves)) do
		local node = minetest.get_node(v)
		local timer = minetest.get_node_timer(v)
		if node.param2 ~= 1 and not timer:is_started() then
			timer:start(math.random(20, 120) / 10)
		end
	end
end

local function leafdecay_on_timer(pos, def)
	if minetest.find_node_near(pos, def.radius, def.trunks) then
		return false
	end

	local node = minetest.get_node(pos)
	local drops = minetest.get_node_drops(node.name)
	for _, item in ipairs(drops) do
		local is_leaf
		for _, v in pairs(def.leaves) do
			if v == item then
				is_leaf = true
			end
		end
		if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
				not is_leaf then
			minetest.add_item({
				x = pos.x - 0.5 + math.random(),
				y = pos.y - 0.5 + math.random(),
				z = pos.z - 0.5 + math.random(),
			}, item)
		end
	end

	minetest.remove_node(pos)
	minetest.check_for_falling(pos)
end

function old_expansion.register_leafdecay(def)
	assert(def.leaves)
	assert(def.trunks)
	assert(def.radius)
	for _, v in pairs(def.trunks) do
		minetest.override_item(v, {
			after_destruct = function(pos, oldnode)
				leafdecay_after_destruct(pos, oldnode, def)
			end,
		})
	end
	for _, v in pairs(def.leaves) do
		minetest.override_item(v, {
			on_timer = function(pos)
				leafdecay_on_timer(pos, def)
			end,
		})
	end
end



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
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n2, n1, n1, n1, n2, n3, n2, n1, n1, n3, n3, n3, n1, n1, n1, n3, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n1, n2, n1, n1, n1, n2, n3, n2, n1, n2, n3, n3, n3, n2, n3, n3, n3, 
n3, n3, n1, n3, n3, n3, n1, n1, n1, n3, n1, n1, n1, n1, n4, n1, n1, 
n1, n1, n4, n1, n1, n1, n2, n4, n2, n1, n2, n3, n4, n3, n2, n3, n3, 
n3, n3, n3, n3, n3, n3, n3, n3, n3, n3, n3, n3, n3, n1, n3, n1, n3, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n1, n1, n1, 
n2, n3, n2, n1, n2, n3, n3, n3, n2, n3, n3, n3, n3, n3, n1, n3, n3, 
n3, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n2, n1, n1, n1, n2, n3, n2, n1, n1, n3, 
n3, n3, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, 

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
