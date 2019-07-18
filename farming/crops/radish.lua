
local S = farming.intllib

-- radish seeds
minetest.register_node("farming:seed_radish", {
	description = S("Radish Seed"),
	tiles = {"farming_radish_seed.png"},
	inventory_image = "farming_radish_seed.png",
	wield_image = "farming_radish_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:radish_1")
	end,
})

-- harvested radish
minetest.register_craftitem("farming:radish", {
	description = S("Radish"),
	inventory_image = "farming_radish.png",
	groups = {food_radish = 1, flammable = 2},
})

-- radish definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_radish_1.png"},
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
minetest.register_node("farming:radish_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_radish_2.png"}
minetest.register_node("farming:radish_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_radish_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:radish'}, rarity = 2},
		{items = {'farming:seed_radish'}, rarity = 1},
	}
}
minetest.register_node("farming:radish_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_radish_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:radish'}, rarity = 1},
		{items = {'farming:radish'}, rarity = 3},
		{items = {'farming:seed_radish'}, rarity = 1},
		{items = {'farming:seed_radish'}, rarity = 3},
	}
}
minetest.register_node("farming:radish_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:radish"] = {
	crop = "farming:radish",
	seed = "farming:seed_radish",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:radish",
	burntime = 1,
})
