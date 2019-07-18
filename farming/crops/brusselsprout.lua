
local S = farming.intllib

-- brusselsprout seeds
minetest.register_node("farming:seed_brusselsprout", {
	description = S("Brussel Sprout Seed"),
	tiles = {"farming_brusselsprout_seed.png"},
	inventory_image = "farming_brusselsprout_seed.png",
	wield_image = "farming_brusselsprout_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:brusselsprout_1")
	end,
})

-- harvested brusselsprout
minetest.register_craftitem("farming:brusselsprout", {
	description = S("Brussel Sprout"),
	inventory_image = "farming_brusselsprout.png",
	groups = {food_brusselsprout = 1, flammable = 2},
})

-- brusselsprout definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_brusselsprout_1.png"},
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
minetest.register_node("farming:brusselsprout_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_brusselsprout_2.png"}
minetest.register_node("farming:brusselsprout_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_brusselsprout_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:brusselsprout'}, rarity = 2},
		{items = {'farming:seed_brusselsprout'}, rarity = 1},
	}
}
minetest.register_node("farming:brusselsprout_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_brusselsprout_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:brusselsprout'}, rarity = 1},
		{items = {'farming:brusselsprout'}, rarity = 3},
		{items = {'farming:seed_brusselsprout'}, rarity = 1},
		{items = {'farming:seed_brusselsprout'}, rarity = 3},
	}
}
minetest.register_node("farming:brusselsprout_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:brusselsprout"] = {
	crop = "farming:brusselsprout",
	seed = "farming:seed_brusselsprout",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:brusselsprout",
	burntime = 1,
})
