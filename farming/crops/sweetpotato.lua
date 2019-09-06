
--[[
	Original textures from DocFarming mod
	https://forum.minetest.net/viewtopic.php?id=3948
]]

local S = farming.intllib

-- spiceleaf seeds
minetest.register_node("farming:seed_sweetpotato", {
	description = S("Sweet Potato Seed"),
	tiles = {"farming_sweetpotato_seed.png"},
	inventory_image = "farming_sweetpotato_seed.png",
	wield_image = "farming_sweetpotato_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:sweetpotato_1")
	end,
})

-- harvested sweetpotato
minetest.register_craftitem("farming:sweetpotato", {
	description = S("Sweet Potato"),
	inventory_image = "farming_sweetpotato.png",
	groups = {food_spiceleaf = 1, flammable = 2},
})

-- baked potato
minetest.register_craftitem("farming:baked_sweetpotato", {
	description = S("Baked Sweet Potato"),
	inventory_image = "farming_baked_sweetpotato.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:baked_sweetpotato",
	recipe = {
		"farming:bakeware", "farming:sweetpotato", "",
		"", "", "",
		"", "", ""
	},
})

-- Potato and cucumber Salad
minetest.register_craftitem("farming:sweetpotato_souffle", {
	description = S("Sweet Potato Souffle"),
	inventory_image = "farming_sweetpotato_souffle.png",
	on_use = minetest.item_eat(10, "farming:bowl"),
})

minetest.register_craft({
	output = "farming:sweetpotato_souffle",
	recipe = {
		{"group:food_cucumber"},
		{"farming:baked_sweetpotato"},
		{"group:food_bowl"},
	}
})

-- potato definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_sweetpotato_1.png"},
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
minetest.register_node("farming:sweetpotato_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_sweetpotato_2.png"}
minetest.register_node("farming:sweetpotato_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_sweetpotato_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:sweetpotato'}, rarity = 1},
		{items = {'farming:sweetpotato'}, rarity = 3},
	}
}
minetest.register_node("farming:sweetpotato_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_sweetpotato_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:sweetpotato 2'}, rarity = 1},
		{items = {'farming:sweetpotato 3'}, rarity = 2},
	}
}
minetest.register_node("farming:sweetpotato_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:sweetpotato"] = {
	crop = "farming:sweetpotato",
	seed = "farming:sweetpotato",
	minlight = 13,
	maxlight = 15,
	steps = 4
}
