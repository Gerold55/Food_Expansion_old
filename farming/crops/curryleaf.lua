
local S = farming.intllib

-- curryleaf seeds
minetest.register_node("farming:seed_curryleaf", {
	description = S("Curry Leaf Seed"),
	tiles = {"farming_curryleaf_seed.png"},
	inventory_image = "farming_curryleaf_seed.png",
	wield_image = "farming_curryleaf_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:curryleaf_1")
	end,
})

-- harvested curryleaf
minetest.register_craftitem("farming:curryleaf", {
	description = S("Curry Leaf"),
	inventory_image = "farming_curryleaf.png",
	groups = {food_curryleaf = 1, flammable = 2},
})

-- curryleaf definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_curryleaf_1.png"},
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
minetest.register_node("farming:curryleaf_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_curryleaf_2.png"}
minetest.register_node("farming:curryleaf_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_curryleaf_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:curryleaf'}, rarity = 2},
		{items = {'farming:seed_curryleaf'}, rarity = 1},
	}
}
minetest.register_node("farming:curryleaf_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_curryleaf_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:curryleaf'}, rarity = 1},
		{items = {'farming:curryleaf'}, rarity = 3},
		{items = {'farming:seed_curryleaf'}, rarity = 1},
		{items = {'farming:seed_curryleaf'}, rarity = 3},
	}
}
minetest.register_node("farming:curryleaf_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:curryleaf"] = {
	crop = "farming:curryleaf",
	seed = "farming:seed_curryleaf",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:curryleaf",
	burntime = 1,
})
