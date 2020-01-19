
--[[
	Original textures from Crops Plus mod
	Copyright (C) 2018 Grizzly Adam
	https://forum.minetest.net/viewtopic.php?f=9&t=19488
]]

local S = farming.intllib

-- garlic clove
minetest.register_craftitem("farming:garlic_clove", {
	description = S("Garlic clove"),
	inventory_image = "crops_garlic_clove.png",
	groups = {food_garlic_clove = 1, flammable = 3},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:garlic_1")
	end,
})

-- garlic bulb
minetest.register_craftitem("farming:garlic", {
	description = S("Garlic"),
	inventory_image = "crops_garlic.png",
	on_use = minetest.item_eat(1),
	groups = {food_garlic = 1, flammable = 3},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:garlic_clove 8",
	recipe = { "farming:garlic" }
})

minetest.register_craft({
	output = "farming:garlic",
	recipe = {
		{"farming:garlic_clove", "farming:garlic_clove", "farming:garlic_clove"},
		{"farming:garlic_clove", "", "farming:garlic_clove"},
		{"farming:garlic_clove", "farming:garlic_clove", "farming:garlic_clove"}
	}
})

-- garlic braid





-- crop definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"crops_garlic_plant_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 3, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:garlic_1", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"crops_garlic_plant_2.png"}
minetest.register_node("farming:garlic_2", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"crops_garlic_plant_3.png"}
minetest.register_node("farming:garlic_3", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"crops_garlic_plant_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	max_items = 5, items = {
		{items = {'farming:garlic'}, rarity = 1},
		{items = {'farming:garlic'}, rarity = 1},
		{items = {'farming:garlic'}, rarity = 1},
		{items = {'farming:garlic'}, rarity = 2},
		{items = {'farming:garlic'}, rarity = 5},
	}
}
minetest.register_node("farming:garlic_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:garlic"] = {
	crop = "farming:garlic",
	seed = "farming:garlic_clove",
	minlight = 13,
	maxlight = 15,
	steps = 5
}
