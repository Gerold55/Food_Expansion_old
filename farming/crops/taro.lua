
local S = farming.intllib

-- taro seeds
minetest.register_node("farming:seed_taro", {
	description = S("Taro Seed"),
	tiles = {"farming_taro_seed.png"},
	inventory_image = "farming_taro_seed.png",
	wield_image = "farming_taro_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:taro_1")
	end,
})

-- harvested taro
minetest.register_craftitem("farming:taro_seeds", {
	description = S("Taro Seeds"),
	inventory_image = "farming_taro.png",
	groups = {food_taro = 1, flammable = 2},
})

-- taro definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_taro_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
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
minetest.register_node("farming:taro_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_taro_2.png"}
minetest.register_node("farming:taro_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_taro_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:taro'}, rarity = 2},
		{items = {'farming:seed_taro'}, rarity = 1},
	}
}
minetest.register_node("farming:taro_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_taro_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:taro'}, rarity = 1},
		{items = {'farming:taro'}, rarity = 3},
		{items = {'farming:seed_taro'}, rarity = 1},
		{items = {'farming:seed_taro'}, rarity = 3},
	}
}
minetest.register_node("farming:taro_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:taro"] = {
	crop = "farming:taro",
	seed = "farming:seed_taro",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:taro",
	burntime = 1,
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:taro", "farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})
