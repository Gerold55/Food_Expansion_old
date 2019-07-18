
local S = farming.intllib

-- spiceleaf seeds
minetest.register_node("farming:seed_spiceleaf", {
	description = S("Spice Leaf Seed"),
	tiles = {"farming_spiceleaf_seed.png"},
	inventory_image = "farming_spiceleaf_seed.png",
	wield_image = "farming_spiceleaf_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:spiceleaf_1")
	end,
})

-- harvested spiceleaf
minetest.register_craftitem("farming:spiceleaf", {
	description = S("Spice Leaf"),
	inventory_image = "farming_spiceleaf.png",
	groups = {food_spiceleaf = 1, flammable = 2},
})

-- spiceleaf definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_spiceleaf_1.png"},
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
minetest.register_node("farming:spiceleaf_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_spiceleaf_2.png"}
minetest.register_node("farming:spiceleaf_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_spiceleaf_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:spiceleaf'}, rarity = 2},
		{items = {'farming:seed_spiceleaf'}, rarity = 1},
	}
}
minetest.register_node("farming:spiceleaf_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_spiceleaf_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:spiceleaf'}, rarity = 1},
		{items = {'farming:spiceleaf'}, rarity = 3},
		{items = {'farming:seed_spiceleaf'}, rarity = 1},
		{items = {'farming:seed_spiceleaf'}, rarity = 3},
	}
}
minetest.register_node("farming:spiceleaf_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:spiceleaf"] = {
	crop = "farming:spiceleaf",
	seed = "farming:seed_spiceleaf",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:spiceleaf",
	burntime = 1,
})