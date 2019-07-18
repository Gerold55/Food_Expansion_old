
local S = farming.intllib

-- rutabaga seeds
minetest.register_node("farming:seed_rutabaga", {
	description = S("rutabaga Seed"),
	tiles = {"farming_rutabaga_seed.png"},
	inventory_image = "farming_rutabaga_seed.png",
	wield_image = "farming_rutabaga_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:rutabaga_1")
	end,
})

-- harvested rutabaga
minetest.register_craftitem("farming:rutabaga", {
	description = S("rutabaga"),
	inventory_image = "farming_rutabaga.png",
	groups = {food_rutabaga = 1, flammable = 2},
})

-- rutabaga definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_rutabaga_1.png"},
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
minetest.register_node("farming:rutabaga_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_rutabaga_2.png"}
minetest.register_node("farming:rutabaga_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_rutabaga_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:rutabaga'}, rarity = 2},
		{items = {'farming:seed_rutabaga'}, rarity = 1},
	}
}
minetest.register_node("farming:rutabaga_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_rutabaga_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:rutabaga'}, rarity = 1},
		{items = {'farming:rutabaga'}, rarity = 3},
		{items = {'farming:seed_rutabaga'}, rarity = 1},
		{items = {'farming:seed_rutabaga'}, rarity = 3},
	}
}
minetest.register_node("farming:rutabaga_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:rutabaga"] = {
	crop = "farming:rutabaga",
	seed = "farming:seed_rutabaga",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:rutabaga",
	burntime = 1,
})
