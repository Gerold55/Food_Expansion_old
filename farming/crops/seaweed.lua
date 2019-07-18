
local S = farming.intllib

-- seaweed seeds
minetest.register_node("farming:seed_seaweed", {
	description = S("seaweed Seed"),
	tiles = {"farming_seaweed_seed.png"},
	inventory_image = "farming_seaweed_seed.png",
	wield_image = "farming_seaweed_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:seaweed_1")
	end,
})

-- harvested seaweed
minetest.register_craftitem("farming:seaweed", {
	description = S("seaweed"),
	inventory_image = "farming_seaweed.png",
	groups = {food_seaweed = 1, flammable = 2},
})

-- seaweed definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_seaweed_1.png"},
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
minetest.register_node("farming:seaweed_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_seaweed_2.png"}
minetest.register_node("farming:seaweed_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_seaweed_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:seaweed'}, rarity = 2},
		{items = {'farming:seed_seaweed'}, rarity = 1},
	}
}
minetest.register_node("farming:seaweed_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_seaweed_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:seaweed'}, rarity = 1},
		{items = {'farming:seaweed'}, rarity = 3},
		{items = {'farming:seed_seaweed'}, rarity = 1},
		{items = {'farming:seed_seaweed'}, rarity = 3},
	}
}
minetest.register_node("farming:seaweed_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:seaweed"] = {
	crop = "farming:seaweed",
	seed = "farming:seed_seaweed",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:seaweed",
	burntime = 1,
})
