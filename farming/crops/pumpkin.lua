
--[[
	Big thanks to PainterlyPack.net for allowing me to use these textures
]]

local S = farming.intllib

-- pumpkin seeds
minetest.register_craftitem("farming:pumpkin_seeds", {
	description = S("Pumpkin Seeds"),
	inventory_image = "farming_pumpkin_seeds.png",
	groups = {seeds = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:pumpkin_1")
	end,
})

minetest.register_craft({
	output = "farming:pumpkin",
	recipe = {
		{"farming:pumpkin_slice", "farming:pumpkin_slice"},
		{"farming:pumpkin_slice", "farming:pumpkin_slice"},
	}
})

minetest.register_craftitem("farming:pumpkin_slice", {
	description = S("Pumpkin Slice"),
	inventory_image = "farming_pumpkin_slice.png",
	on_use = minetest.item_eat(8),
	groups = {food_bread = 1, flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:pumpkin_slice 4, farming:pumpkin_seeds 4",
	recipe = {"farming:pumpkin", "farming:cutting_board"},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}},
})

-- jack 'o lantern
minetest.register_node("farming:jackolantern", {
	description = S("Jack 'O Lantern (punch to turn on and off)"),
	tiles = {
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png"
	},
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, node, puncher)
		node.name = "farming:jackolantern_on"
		minetest.swap_node(pos, node)
	end,
})

minetest.register_node("farming:jackolantern_on", {
	tiles = {
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png",
		"farming_pumpkin_jack_o_lantern.png"
	},
	light_source = default.LIGHT_MAX - 1,
	paramtype2 = "facedir",
	groups = {
		choppy = 1, oddly_breakable_by_hand = 1, flammable = 2,
		not_in_creative_inventory = 1
	},
	sounds = default.node_sound_wood_defaults(),
	drop = "farming:jackolantern",
	on_punch = function(pos, node, puncher)
		node.name = "farming:jackolantern"
		minetest.swap_node(pos, node)
	end,
})

minetest.register_craft({
	output = "farming:jackolantern",
	recipe = {
		{"default:torch"},
		{"group:food_pumpkin"},
	}
})

--- wooden scarecrow base
minetest.register_node("farming:scarecrow_bottom", {
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	tiles = {"default_wood.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
			{-12/16, 4/16, -1/16, 12/16, 2/16, 1/16},
		},
	},
	groups = {snappy = 3, flammable = 2},
})

minetest.register_craft({
	output = "farming:scarecrow_bottom",
	recipe = {
		{"", "group:stick", "",},
		{"group:stick", "group:stick", "group:stick",},
		{"", "group:stick", "",}
	}
})

-- pumpkin bread
minetest.register_craftitem("farming:pumpkin_bread", {
	description = S("Pumpkin Bread"),
	inventory_image = "farming_pumpkin_bread.png",
	on_use = minetest.item_eat(8),
	groups = {food_bread = 1, flammable = 2},
})

minetest.register_craftitem("farming:pumpkin_dough", {
	description = S("Pumpkin Dough"),
	inventory_image = "farming_pumpkin_dough.png",
})

minetest.register_craft({
	output = "farming:pumpkin_dough",
	type = "shapeless",
	recipe = {"group:food_flour", "group:food_pumpkin_slice", "group:food_pumpkin_slice"}
})

minetest.register_craft({
	type = "cooking",
	output = "farming:pumpkin_bread",
	recipe = "farming:pumpkin_dough",
	cooktime = 10
})

-- pumpkin definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_pumpkin_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:pumpkin_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_pumpkin_2.png"}
minetest.register_node("farming:pumpkin_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_pumpkin_3.png"}
minetest.register_node("farming:pumpkin_3", table.copy(crop_def))

-- stage 4 (final)

crop_def.tiles = {"farming_pumpkin_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:pumpkin_slice 9, farming:pumpkin_seeds 4'}, rarity = 1},
	}
}
minetest.register_node("farming:pumpkin_4", table.copy(crop_def))



-- add to registered_plants
farming.registered_plants["farming:pumpkin"] = {
	crop = "farming:pumpkin",
	seed = "farming:pumpkin_slice",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
