
local S = farming.intllib

-- cactusfruit seeds
minetest.register_node("farming:seed_cactusfruit", {
	description = S("Cactus Fruit Seed"),
	tiles = {"farming_cactusfruit_seed.png"},
	inventory_image = "farming_cactusfruit_seed.png",
	wield_image = "farming_cactusfruit_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:cactusfruit_1")
	end,
})

-- harvested cactusfruit
minetest.register_craftitem("farming:cactusfruit", {
	description = S("Cactus Fruit"),
	inventory_image = "farming_cactusfruit.png",
	groups = {food_cactusfruit = 1, flammable = 2},
})

minetest.register_craftitem("farming:juice_cactusfruit", {
	description = S("cactusfruit Juice"),
	inventory_image = "farming_cactusfruit_juice.png",
	groups = {food_blackberry = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})

-- cactusfruit definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_cactusfruit_1.png"},
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
minetest.register_node("farming:cactusfruit_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_cactusfruit_2.png"}
minetest.register_node("farming:cactusfruit_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_cactusfruit_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:cactusfruit'}, rarity = 2},
		{items = {'farming:seed_cactusfruit'}, rarity = 1},
	}
}
minetest.register_node("farming:cactusfruit_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_cactusfruit_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:cactusfruit'}, rarity = 1},
		{items = {'farming:cactusfruit'}, rarity = 3},
		{items = {'farming:seed_cactusfruit'}, rarity = 1},
		{items = {'farming:seed_cactusfruit'}, rarity = 3},
	}
}
minetest.register_node("farming:cactusfruit_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:cactusfruit"] = {
	crop = "farming:cactusfruit",
	seed = "farming:seed_cactusfruit",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:cactusfruit",
	burntime = 1,
})
