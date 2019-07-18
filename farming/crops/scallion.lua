
local S = farming.intllib

-- scallion seeds
minetest.register_node("farming:seed_scallion", {
	description = S("scallion Seed"),
	tiles = {"farming_scallion_seed.png"},
	inventory_image = "farming_scallion_seed.png",
	wield_image = "farming_scallion_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:scallion_1")
	end,
})

-- harvested scallion
minetest.register_craftitem("farming:scallion", {
	description = S("scallion"),
	inventory_image = "farming_scallion.png",
	groups = {food_scallion = 1, flammable = 2},
})

-- scallion definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_scallion_1.png"},
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
minetest.register_node("farming:scallion_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_scallion_2.png"}
minetest.register_node("farming:scallion_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_scallion_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:scallion'}, rarity = 2},
		{items = {'farming:seed_scallion'}, rarity = 1},
	}
}
minetest.register_node("farming:scallion_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_scallion_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:scallion'}, rarity = 1},
		{items = {'farming:scallion'}, rarity = 3},
		{items = {'farming:seed_scallion'}, rarity = 1},
		{items = {'farming:seed_scallion'}, rarity = 3},
	}
}
minetest.register_node("farming:scallion_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:scallion"] = {
	crop = "farming:scallion",
	seed = "farming:seed_scallion",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:scallion",
	burntime = 1,
})
