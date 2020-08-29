
--[[
	Original textures from PixelBox texture pack
	https://forum.minetest.net/viewtopic.php?id=4990
]]

local S = farming.intllib

-- peanut
minetest.register_craftitem("farming:peanut", {
	description = S("Peanut"),
	inventory_image = "farming_peanut.png",
	groups = {food_peanut = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:peanut_1")
	end,
})

-- peanut butter
minetest.register_craftitem("farming:peanut_butter", {
	description = S("Peanut Butter"),
	inventory_image = "farming_peanut_butter.png",
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	groups = {food_nut_butter = 1, flammable = 2, vessel = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:peanut_butter 2",
	recipe = {
		"farming:mortar_pestle", "group:food_nut_butter", "",
		"farming:cooking_oil", "", "",
		"", "", ""
	}
})

-- peanut definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_peanut_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
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
minetest.register_node("farming:peanut_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_peanut_2.png"}
minetest.register_node("farming:peanut_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_peanut_3.png"}
minetest.register_node("farming:peanut_3", table.copy(crop_def))

-- stage 4 (final)
crop_def.tiles = {"farming_peanut_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:peanut 2'}, rarity = 1},
		{items = {'farming:peanut 3'}, rarity = 2},
	}
}
minetest.register_node("farming:peanut_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:peanut"] = {
	crop = "farming:peanut",
	seed = "farming:peanut",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
