
local S = farming.intllib

-- chili_pepper seeds
minetest.register_node("farming:seed_chili", {
	description = S("Chili Pepper Seed"),
	tiles = {"farming_chili_pepper_seed.png"},
	inventory_image = "farming_chili_pepper_seed.png",
	wield_image = "farming_chili_pepper_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:chili_1")
	end,
})

-- harvested chili_pepper
minetest.register_craftitem("farming:chili", {
	description = S("Chili Pepper"),
	inventory_image = "farming_chili_pepper.png",
	groups = {food_chili_pepper = 1, flammable = 2},
})

-- bowl of chili
minetest.register_craftitem("farming:chili_bowl", {
	description = S("Bowl of Chili"),
	inventory_image = "farming_chili_bowl.png",
	on_use = minetest.item_eat(8, "farming:bowl"),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:chili_bowl",
	recipe = {
		"group:food_chili", "group:food_barley",
		"group:food_tomato", "group:food_beans", "group:food_bowl"
	},
})

-- chili can be used for red dye
minetest.register_craft({
	output = "dye:red",
	recipe = {
		{'farming:chili'},
	}
})

-- chili_pepper definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_chili_1.png"},
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
minetest.register_node("farming:chili_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_chili_2.png"}
minetest.register_node("farming:chili_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_chili_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:chili'}, rarity = 2},
		{items = {'farming:seed_chili'}, rarity = 1},
	}
}
minetest.register_node("farming:chili_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_chili_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:chili'}, rarity = 1},
		{items = {'farming:chili'}, rarity = 3},
		{items = {'farming:seed_chili'}, rarity = 1},
		{items = {'farming:seed_chili'}, rarity = 3},
	}
}
minetest.register_node("farming:chili_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:chili"] = {
	crop = "farming:chili",
	seed = "farming:seed_chili",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:chili",
	burntime = 1,
})
