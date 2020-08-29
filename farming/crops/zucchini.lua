
local S = farming.intllib

-- wheat seeds
minetest.register_node("farming:seed_zucchini", {
	description = S("Zucchini Seed"),
	tiles = {"farming_zucchini_seeds.png"},
	inventory_image = "farming_zucchini_seeds.png",
	wield_image = "farming_zucchini_seeds.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:zucchini_1")
	end,
})

-- harvested wheat
minetest.register_craftitem("farming:zucchini", {
	description = S("Zucchini"),
	inventory_image = "farming_zucchini.png",
	groups = {food_wheat = 1, flammable = 4},
})

-- straw
--minetest.register_node("farming:straw", {
--	description = S("Straw"),
--	tiles = {"farming_straw.png"},
--	is_ground_content = false,
--	groups = {snappy = 3, flammable = 4, fall_damage_add_percent = -30},
--	sounds = default.node_sound_leaves_defaults(),
--})

--minetest.register_node("farming:straw", {
--	description = "Straw",
--	tiles = {"farming_straw.png"},
--	is_ground_content = false,
--	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
--	sounds = default.node_sound_leaves_defaults(),
--})

---minetest.register_craft({
---	output = "farming:straw 3",
--	recipe = {
--		{"farming:wheat", "farming:wheat", "farming:wheat"},
--		{"farming:wheat", "farming:wheat", "farming:wheat"},
--		{"farming:wheat", "farming:wheat", "farming:wheat"},
--	}
--})

-- wheat definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_zucchini_crop_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 4, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:zucchini_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_zucchini_crop_2.png"}
minetest.register_node("farming:zucchini_2", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_zucchini_crop_3.png"}
minetest.register_node("farming:zucchini_3", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_zucchini_crop_4.png"}
minetest.register_node("farming:zucchini_4", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_zucchini_crop_5.png"}
crop_def.drop = {
	items = {
		{items = {'farming:seed_zucchini'}, rarity = 2},
	}
}
minetest.register_node("farming:zucchini_5", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_zucchini_crop_6.png"}
crop_def.drop = {
	items = {
		{items = {'farming:seed_zucchini'}, rarity = 2},
	}
}
minetest.register_node("farming:zucchini_6", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_zucchini_crop_7.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:zucchini'}, rarity = 1},
		{items = {'farming:zucchini'}, rarity = 3},
		{items = {'farming:seed_zucchini'}, rarity = 1},
		{items = {'farming:seed_zucchini'}, rarity = 3},
	}
}
minetest.register_node("farming:zucchini_7", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:zucchini"] = {
	crop = "farming:zucchini",
	seed = "farming:seed_zucchini",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
