
local S = farming.intllib

-- chickpea seeds
minetest.register_node("farming:seed_chickpea", {
	description = S("Chickpea Seed"),
	tiles = {"farming_chickpea_seed.png"},
	inventory_image = "farming_chickpea_seed.png",
	wield_image = "farming_chickpea_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:chickpea_1")
	end,
})

-- harvested chickpea
minetest.register_craftitem("farming:chickpea", {
	description = S("Chickpea"),
	inventory_image = "farming_chickpea.png",
	groups = {food_chickpea = 1, flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:chickpea", "farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})

-- chickpea definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_chickpea_1.png"},
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
minetest.register_node("farming:chickpea_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_chickpea_2.png"}
minetest.register_node("farming:chickpea_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_chickpea_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:chickpea'}, rarity = 2},
		{items = {'farming:seed_chickpea'}, rarity = 1},
	}
}
minetest.register_node("farming:chickpea_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_chickpea_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:chickpea'}, rarity = 1},
		{items = {'farming:chickpea'}, rarity = 3},
		{items = {'farming:seed_chickpea'}, rarity = 1},
		{items = {'farming:seed_chickpea'}, rarity = 3},
	}
}
minetest.register_node("farming:chickpea_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:chickpea"] = {
	crop = "farming:chickpea",
	seed = "farming:seed_chickpea",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:chickpea",
	burntime = 1,
})
