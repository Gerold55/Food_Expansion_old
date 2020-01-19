
local S = farming.intllib

-- sunflower seeds
minetest.register_node("farming:seeds_sunflower", {
	description = S("Sunflower Seeds"),
	tiles = {"farming_sunflower_seeds.png"},
	inventory_image = "farming_sunflower_seeds.png",
	wield_image = "farming_sunflower_seeds.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, food_sunflower = 1,},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:sunflower_1")
	end,
})

-- harvested sunflower

-- sunflower definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_sunflower_1.png"},
	paramtype = "light",
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
minetest.register_node("farming:sunflower_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_sunflower_2.png"}
minetest.register_node("farming:sunflower_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_sunflower_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:sunflower'}, rarity = 2},
		{items = {'farming:seed_sunflower'}, rarity = 1},
	}
}
minetest.register_node("farming:sunflower_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_sunflower_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:sunflower'}, rarity = 1},
		{items = {'farming:sunflower'}, rarity = 3},
		{items = {'farming:seed_sunflower'}, rarity = 1},
		{items = {'farming:seed_sunflower'}, rarity = 3},
	}
}
minetest.register_node("farming:sunflower_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:sunflower"] = {
	crop = "farming:sunflower",
	seed = "farming:seed_sunflower",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:sunflower",
	burntime = 1,
})
