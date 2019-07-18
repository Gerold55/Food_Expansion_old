
--[[
	Textures edited from:
	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/1288375-food-plus-mod-more-food-than-you-can-imagine-v2-9)
]]

local S = farming.intllib

-- elderberry seeds
minetest.register_node("farming:seed_elderberry", {
	description = S("Elderberry Seed"),
	tiles = {"farming_elderberry_seed.png"},
	inventory_image = "farming_elderberry_seed.png",
	wield_image = "farming_elderberry_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:elderberry_1")
	end,
})

-- harvested elderberry
minetest.register_craftitem("farming:elderberry", {
	description = S("Elderberry"),
	inventory_image = "farming_elderberry.png",
	groups = {food_elderberry = 1, flammable = 2},
})

-- elderberry definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_elderberry_1.png"},
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
minetest.register_node("farming:elderberry_1", table.copy(crop_def))

-- stage2
crop_def.tiles = {"farming_elderberry_2.png"}
minetest.register_node("farming:elderberry_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_elderberry_3.png"}
minetest.register_node("farming:elderberry_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_elderberry_4.png"}
minetest.register_node("farming:elderberry_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_elderberry_5.png"}
minetest.register_node("farming:elderberry_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_elderberry_6.png"}
minetest.register_node("farming:elderberry_6", table.copy(crop_def))

-- stage 7
crop_def.tiles = {"farming_elderberry_7.png"}
crop_def.drop = {
	items = {
		{items = {'farming:elderberry'}, rarity = 1},
		{items = {'farming:elderberry'}, rarity = 3},
	}
}
minetest.register_node("farming:elderberry_7", table.copy(crop_def))

-- stage 8 (final)
crop_def.tiles = {"farming_elderberry_8.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:elderberry 3'}, rarity = 1},
		{items = {'farming:elderberry 3'}, rarity = 2},
	}
}
minetest.register_node("farming:elderberry_8", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:elderberry"] = {
	crop = "farming:elderberry",
	seed = "farming:elderberry",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
