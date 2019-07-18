
local S = farming.intllib

-- jicama seeds
minetest.register_node("farming:seed_jicama", {
	description = S("Jicama Seed"),
	tiles = {"farming_jicama_seed.png"},
	inventory_image = "farming_jicama_seed.png",
	wield_image = "farming_jicama_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:jicama_1")
	end,
})

-- harvested jicama
minetest.register_craftitem("farming:jicama", {
	description = S("Jicama"),
	inventory_image = "farming_jicama.png",
	groups = {food_jicama = 1, flammable = 2},
})

-- jicama definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_jicama_1.png"},
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
minetest.register_node("farming:jicama_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_jicama_2.png"}
minetest.register_node("farming:jicama_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_jicama_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:jicama'}, rarity = 2},
		{items = {'farming:seed_jicama'}, rarity = 1},
	}
}
minetest.register_node("farming:jicama_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_jicama_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:jicama'}, rarity = 1},
		{items = {'farming:jicama'}, rarity = 3},
		{items = {'farming:seed_jicama'}, rarity = 1},
		{items = {'farming:seed_jicama'}, rarity = 3},
	}
}
minetest.register_node("farming:jicama_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:jicama"] = {
	crop = "farming:jicama",
	seed = "farming:seed_jicama",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:jicama",
	burntime = 1,
})
