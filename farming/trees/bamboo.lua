local S = minetest.get_translator(minetest.get_current_modname())

local ai = {name = "air", param1 = 000}
local bt = {name = "farming:trunk", param1 = 255}
local bf = {name = "farming:trunk", param1 = 255, force_place = true}
local fd = {name = "default:dirt", param1 = 255, force_place = true}
local lp = {name = "farming:leaves", param1 = 255}
local lr = {name = "farming:leaves", param1 = 100}

farming.bambootree = {
	
	size = {x=3, y=18, z=3},
	data = {
	
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		lr, lr, lr,
		lr, lp, lr,
		ai, lp, ai,
		ai, ai, ai,
		
		ai, fd, ai,
		ai, bf, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		ai, bt, ai,
		lr, bt, lr,
		lr, lp, lr,
		ai, lp, ai,
		ai, lr, ai,
		
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		lr, lr, lr,
		lr, lp, lr,
		ai, lp, ai,
		ai, ai, ai,
		
		},
		
	yslice_prob = {
		{ypos = 3, prob = 127},
		{ypos = 4, prob = 127},
		{ypos = 5, prob = 127},
		{ypos = 6, prob = 127},
		{ypos = 7, prob = 127},
		{ypos = 8, prob = 127},
		{ypos = 9, prob = 127},
		{ypos = 10, prob = 127},
		{ypos = 11, prob = 127},
		{ypos = 12, prob = 127},
		},
		
	}
	
local function grow_new_bambootree_tree(pos)
	if not default.can_grow(pos)
then 
	minetest.get_node_timer(pos):start(math.random(240, 600))
	return
end
minetest.remove_node(pos)
minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
farming.bambootree, "0", nil, false)
end

--
-- Decoration
--

minetest.register_decoration ({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.005,
		scale = 0.001,
		spread = {x = 240, y = 240, z = 240},
		seed = 2776,
		octaves = 3,
		persist = 0.65,
		},
	biomes = {"savanna"},
	y_min = 2,
	y_max = 20,
	schematic = farming.bambootree,
	flags = "place_center_x, place_center_z",
})

--
-- Nodes
--

minetest.register_node("farming:trunk",{
	description = S("Bamboo"),
	drawtype = "plantlike",
	tiles = {"bamboo_stalk.png"},
	inventory_image = "bamboo_stalk.png",
	wield_image = "bamboo_stalk.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	selection_box = {
	type = "fixed",
	fixed = {-0.125, -0.5, -0.125, 0.0625, 0.5, 0.0625}},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
	default.dig_up(pos, node, digger)
	end,
	
})

minetest.register_node("farming:wood_bamboo",{
	description = S("Bamboo Wood"),
	tiles = {"bamboo_wood.png"},
	param2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
	})
	
minetest.register_node("farming:leaves", {
	description = S("Bamboo Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"bamboo_large_leaves.png"},
	inventory_image = "bamboo_large_leaves.png",
	wield_image = "bamboo_large_leaves.png",
	param1 = "light",
	walkable = true, 
	waving = 1, 
	groups = {snappy = 1, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {max_items = 1,
	items = {
	items = {"farming:sprout"},
	rarity = 10},
	{items = {"farming:leaves"}}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("farming:sprout",{
	description = S("Bamboo Sprout"),
	drawtype = "plantlike",
	tiles = {"bamboo_stage0.png"},
	inventory_image = "bamboo_stage0.png",
	wield_image = "bamboo_stage0.png",
	param1 = "light",
	sunlight_propagates = true,
	walkable = false, 
	groups = {snappy = 3, attached_node =1, flammable = 2,
	dig_immediate = 3, ethereal_sapling = 1},
	sounds = default.node_sound_defaults(),
	selection_box = {
	type = "fixed",
	fixed = {-4/16, -0.5, -4/16, 4/16, 0, 4/16}
	},
	on_use = minetest.item_eat(2),
	grown_height = 11,
	on_timer = grow_new_bambootree_tree,
	on_construct = function(pos)
	minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	})
	
--
-- crafts
--

minetest.register_craft({
	output = "farming:wood_bamboo",
	recipe = {{"farming:trunk"}}
	})
	
default.register_leafdecay({
	trunks = {"farming:trunk"},
	leaves = {"farming:leaves"},
	radius = 3,
	})
	
minetest.register_lbm({
	name = "farming:convert_bambootree_sprouts_to_node_timer",
		nodenames = {"farming:sprout"},
		action = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
		end
})