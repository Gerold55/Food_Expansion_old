
local S = farming.intllib

-- mustard seeds
minetest.register_node("farming:seed_mustard", {
	description = S("Mustard Seeds"),
	tiles = {"farming_mustard_seeds.png"},
	inventory_image = "farming_mustard_seeds.png",
	wield_image = "farming_mustard_seeds.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:mustard_1")
	end,
})

-- mustard definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_cotton_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop =  "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 4, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:mustard_1", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_cotton_2.png"}
crop_def.drop = {
	items = {
		{items = {"farming:seed_mustard"}, rarity = 1},
	}
}
minetest.register_node("farming:mustard_3", table.copy(crop_def))

-- stage 8 (final)
crop_def.tiles = {"farming_mustard_3.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {"farming:seed_mustard"}, rarity = 1},
		{items = {"farming:seed_mustard"}, rarity = 2},
		{items = {"farming:seed_mustard"}, rarity = 3},
	}
}
minetest.register_node("farming:mustard_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:mustard"] = {
	crop = "farming:mustard",
	seed = "farming:seed_mustard",
	minlight = 13,
	maxlight = 15,
	steps = 8
}