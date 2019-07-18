
local S = farming.intllib

-- ginger seeds
minetest.register_node("farming:seed_ginger", {
	description = S("Ginger Seed"),
	tiles = {"farming_ginger_seed.png"},
	inventory_image = "farming_ginger_seed.png",
	wield_image = "farming_ginger_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:ginger_1")
	end,
})

-- harvested ginger
minetest.register_craftitem("farming:ginger", {
	description = S("Ginger"),
	inventory_image = "farming_ginger.png",
	groups = {food_ginger = 1, flammable = 2},
})

-- ginger definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_ginger_1.png"},
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
minetest.register_node("farming:ginger_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_ginger_2.png"}
minetest.register_node("farming:ginger_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_ginger_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:ginger'}, rarity = 2},
		{items = {'farming:seed_ginger'}, rarity = 1},
	}
}
minetest.register_node("farming:ginger_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_ginger_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:ginger'}, rarity = 1},
		{items = {'farming:ginger'}, rarity = 3},
		{items = {'farming:seed_ginger'}, rarity = 1},
		{items = {'farming:seed_ginger'}, rarity = 3},
	}
}
minetest.register_node("farming:ginger_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:ginger"] = {
	crop = "farming:ginger",
	seed = "farming:seed_ginger",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:ginger",
	burntime = 1,
})
