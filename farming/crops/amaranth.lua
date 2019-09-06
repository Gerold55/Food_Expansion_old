
local S = farming.intllib

-- amaranth seeds
minetest.register_node("farming:seed_amaranth", {
	description = S("Amaranth Seed"),
	tiles = {"farming_amaranth_seed.png"},
	inventory_image = "farming_amaranth_seed.png",
	wield_image = "farming_amaranth_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:amaranth_1")
	end,
})

-- harvested amaranth
minetest.register_craftitem("farming:amaranth", {
	description = S("Amaranth"),
	inventory_image = "farming_amaranth.png",
	groups = {food_amaranth = 1, flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:amaranth", "farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})

-- amaranth definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_amaranth_1.png"},
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
minetest.register_node("farming:amaranth_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_amaranth_2.png"}
minetest.register_node("farming:amaranth_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_amaranth_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:amaranth'}, rarity = 2},
		{items = {'farming:seed_amaranth'}, rarity = 1},
	}
}
minetest.register_node("farming:amaranth_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_amaranth_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:amaranth'}, rarity = 1},
		{items = {'farming:amaranth'}, rarity = 3},
		{items = {'farming:seed_amaranth'}, rarity = 1},
		{items = {'farming:seed_amaranth'}, rarity = 3},
	}
}
minetest.register_node("farming:amaranth_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:amaranth"] = {
	crop = "farming:amaranth",
	seed = "farming:seed_amaranth",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:amaranth",
	burntime = 1,
})
