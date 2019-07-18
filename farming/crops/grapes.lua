
local S = farming.intllib

-- grapes seeds
minetest.register_node("farming:seed_grapes", {
	description = S("Grape Seed"),
	tiles = {"farming_grapes_seed.png"},
	inventory_image = "farming_grapes_seed.png",
	wield_image = "farming_grapes_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:grapes_1")
	end,
})

-- harvested grapes
minetest.register_craftitem("farming:grapes", {
	description = S("Grapes"),
	inventory_image = "farming_grapes.png",
	groups = {food_grapes = 1, flammable = 2},
})

minetest.register_craftitem("farming:juice_grape", {
	description = S("Grape Juice"),
	inventory_image = "farming_grape_juice.png",
	groups = {food_grape = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})

-- grapes definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_grapes_1.png"},
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
minetest.register_node("farming:grapes_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_grapes_2.png"}
minetest.register_node("farming:grapes_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_grapes_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:grapes'}, rarity = 2},
		{items = {'farming:seed_grapes'}, rarity = 1},
	}
}
minetest.register_node("farming:grapes_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_grapes_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:grapes'}, rarity = 1},
		{items = {'farming:grapes'}, rarity = 3},
		{items = {'farming:seed_grapes'}, rarity = 1},
		{items = {'farming:seed_grapes'}, rarity = 3},
	}
}
minetest.register_node("farming:grapes_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:grapes"] = {
	crop = "farming:grapes",
	seed = "farming:seed_grapes",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

minetest.register_craftitem("farming:juice_grape", {
	description = S("Grape Juice"),
	inventory_image = "farming_grape_juice.png",
	groups = {food_blackberry = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:grapes",
	burntime = 1,
})
