
local S = farming.intllib

-- candleberry seeds
minetest.register_node("farming:seed_candleberry", {
	description = S("CandleBerry Seed"),
	tiles = {"farming_candleberry_seed.png"},
	inventory_image = "farming_candleberry_seed.png",
	wield_image = "farming_candleberry_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:candleberry_1")
	end,
})

-- harvested candleberry
minetest.register_craftitem("farming:candleberry", {
	description = S("CandleBerry"),
	inventory_image = "farming_candleberry.png",
	groups = {food_candleberry = 1, flammable = 2},
})

-- candleberry definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_candleberry_1.png"},
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
minetest.register_node("farming:candleberry_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_candleberry_2.png"}
minetest.register_node("farming:candleberry_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_candleberry_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:candleberry'}, rarity = 2},
		{items = {'farming:seed_candleberry'}, rarity = 1},
	}
}
minetest.register_node("farming:candleberry_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_candleberry_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:candleberry'}, rarity = 1},
		{items = {'farming:candleberry'}, rarity = 3},
		{items = {'farming:seed_candleberry'}, rarity = 1},
		{items = {'farming:seed_candleberry'}, rarity = 3},
	}
}
minetest.register_node("farming:candleberry_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:candleberry"] = {
	crop = "farming:candleberry",
	seed = "farming:seed_candleberry",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:candleberry",
	burntime = 1,
})
