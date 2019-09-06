
local S = farming.intllib

-- quinoa seeds
minetest.register_node("farming:seed_quinoa", {
	description = S("quinoa Seed"),
	tiles = {"farming_quinoa_seed.png"},
	inventory_image = "farming_quinoa_seed.png",
	wield_image = "farming_quinoa_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:quinoa_1")
	end,
})

-- harvested quinoa
minetest.register_craftitem("farming:quinoa", {
	description = S("quinoa"),
	inventory_image = "farming_quinoa.png",
	groups = {food_quinoa = 1, flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:quinoa", "farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})

-- quinoa definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_quinoa_1.png"},
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
minetest.register_node("farming:quinoa_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_quinoa_2.png"}
minetest.register_node("farming:quinoa_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_quinoa_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:quinoa'}, rarity = 2},
		{items = {'farming:seed_quinoa'}, rarity = 1},
	}
}
minetest.register_node("farming:quinoa_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_quinoa_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:quinoa'}, rarity = 1},
		{items = {'farming:quinoa'}, rarity = 3},
		{items = {'farming:seed_quinoa'}, rarity = 1},
		{items = {'farming:seed_quinoa'}, rarity = 3},
	}
}
minetest.register_node("farming:quinoa_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:quinoa"] = {
	crop = "farming:quinoa",
	seed = "farming:seed_quinoa",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:quinoa",
	burntime = 1,
})
