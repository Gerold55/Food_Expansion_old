
local S = farming.intllib

-- lentil seeds
minetest.register_node("farming:seed_lentil", {
	description = S("lentil Seed"),
	tiles = {"farming_lentil_seed.png"},
	inventory_image = "farming_lentil_seed.png",
	wield_image = "farming_lentil_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:lentil_1")
	end,
})

-- harvested lentil
minetest.register_craftitem("farming:lentil", {
	description = S("lentil"),
	inventory_image = "farming_lentil.png",
	groups = {food_lentil = 1, flammable = 2},
})

-- lentil definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_lentil_1.png"},
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
minetest.register_node("farming:lentil_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_lentil_2.png"}
minetest.register_node("farming:lentil_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_lentil_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:lentil'}, rarity = 2},
		{items = {'farming:seed_lentil'}, rarity = 1},
	}
}
minetest.register_node("farming:lentil_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_lentil_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:lentil'}, rarity = 1},
		{items = {'farming:lentil'}, rarity = 3},
		{items = {'farming:seed_lentil'}, rarity = 1},
		{items = {'farming:seed_lentil'}, rarity = 3},
	}
}
minetest.register_node("farming:lentil_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:lentil"] = {
	crop = "farming:lentil",
	seed = "farming:seed_lentil",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:lentil",
	burntime = 1,
})
