
local S = farming.intllib

-- ginger seeds
minetest.register_node("farming:seeds_ginger", {
	description = S("Ginger Seeds"),
	tiles = {"farming_ginger_seeds.png"},
	inventory_image = "farming_ginger_seeds.png",
	wield_image = "farming_ginger_seeds.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:ginger_1")
	end,
})

-- green ginger
minetest.register_craftitem("farming:ginger", {
	description = S("Ginger"),
	inventory_image = "farming_ginger.png",
	on_use = minetest.item_eat(2),
	groups = {food_ginger = 1, flammable = 3},
})

-- ginger definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_ginger_crop_0.png"},
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
minetest.register_node("farming:ginger_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_ginger_crop_1.png"}
minetest.register_node("farming:ginger_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_ginger_crop_2.png"}
crop_def.drop = {
	items = {
		{items = {'farming:ginger'}, rarity = 2},
		{items = {'farming:seed_ginger'}, rarity = 1},
	}
}
minetest.register_node("farming:ginger_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_ginger_crop_3.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:ginger'}, rarity = 1},
		{items = {'farming:ginger'}, rarity = 3},
		{items = {'farming:seed_ginger'}, rarity = 1},
		{items = {'farming:seed_ginger'}, rarity = 3},
	}
}
minetest.register_node("farming:ginger_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:ginger"] = {
	crop = "farming:ginger",
	seed = "farming:seed_ginger",
	minlight = 13,
	maxlight = 15,
	steps = 7
}