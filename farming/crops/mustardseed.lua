
local S = farming.intllib

-- mustardseed seeds
minetest.register_node("farming:seed_mustardseed", {
	description = S("Mustardseed Seed"),
	tiles = {"farming_mustardseed_seed.png"},
	inventory_image = "farming_mustardseed_seed.png",
	wield_image = "farming_mustardseed_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:mustardseed_1")
	end,
})

-- harvested mustardseed
minetest.register_craftitem("farming:mustardseed", {
	description = S("Mustardseed"),
	inventory_image = "farming_mustardseed.png",
	groups = {food_mustardseed = 1, flammable = 2},
})

-- mustardseed definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_mustardseed_1.png"},
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
minetest.register_node("farming:mustardseed_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_mustardseed_2.png"}
minetest.register_node("farming:mustardseed_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_mustardseed_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:mustardseed'}, rarity = 2},
		{items = {'farming:seed_mustardseed'}, rarity = 1},
	}
}
minetest.register_node("farming:mustardseed_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_mustardseed_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:mustardseed'}, rarity = 1},
		{items = {'farming:mustardseed'}, rarity = 3},
		{items = {'farming:seed_mustardseed'}, rarity = 1},
		{items = {'farming:seed_mustardseed'}, rarity = 3},
	}
}
minetest.register_node("farming:mustardseed_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:mustardseed"] = {
	crop = "farming:mustardseed",
	seed = "farming:seed_mustardseed",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:mustardseed",
	burntime = 1,
})
