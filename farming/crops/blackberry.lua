
local S = farming.intllib

-- blackberry seeds
minetest.register_node("farming:seed_blackberry", {
	description = S("Blackberry Seed"),
	tiles = {"farming_blackberry_seed.png"},
	inventory_image = "farming_blackberry_seed.png",
	wield_image = "farming_blackberry_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:blackberry_1")
	end,
})

-- harvested blackberry
minetest.register_craftitem("farming:blackberries", {
	description = S("Blackberry"),
	inventory_image = "farming_blackberry.png",
	groups = {food_blackberry = 1, flammable = 2},
})

minetest.register_craftitem("farming:juice_blackberry", {
	description = S("Blackberry Juice"),
	inventory_image = "farming_blackberry_juice.png",
	groups = {food_blackberry = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})

-- blackberry definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_blackberry_1.png"},
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
minetest.register_node("farming:blackberry_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_blackberry_2.png"}
minetest.register_node("farming:blackberry_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_blackberry_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:blackberry'}, rarity = 2},
		{items = {'farming:seed_blackberry'}, rarity = 1},
	}
}
minetest.register_node("farming:blackberry_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_blackberry_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:blackberry'}, rarity = 1},
		{items = {'farming:blackberry'}, rarity = 3},
		{items = {'farming:seed_blackberry'}, rarity = 1},
		{items = {'farming:seed_blackberry'}, rarity = 3},
	}
}
minetest.register_node("farming:blackberry_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:blackberry"] = {
	crop = "farming:blackberry",
	seed = "farming:seed_blackberry",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:blackberry",
	burntime = 1,
})
