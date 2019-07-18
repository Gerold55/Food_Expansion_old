
local S = farming.intllib

-- bambooshoot seeds
minetest.register_node("farming:seed_bambooshoot", {
	description = S("Bamboo Shoot Seed"),
	tiles = {"farming_bambooshoot_seed.png"},
	inventory_image = "farming_bambooshoot_seed.png",
	wield_image = "farming_bambooshoot_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:bambooshoot_1")
	end,
})

-- harvested bambooshoot
minetest.register_craftitem("farming:bambooshoot", {
	description = S("Bamboo Shoot"),
	inventory_image = "farming_bambooshoot.png",
	groups = {food_bambooshoot = 1, flammable = 2},
})

-- bambooshoot definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_bambooshoot_1.png"},
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
minetest.register_node("farming:bambooshoot_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_bambooshoot_2.png"}
minetest.register_node("farming:bambooshoot_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_bambooshoot_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:bambooshoot'}, rarity = 2},
		{items = {'farming:seed_bambooshoot'}, rarity = 1},
	}
}
minetest.register_node("farming:bambooshoot_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_bambooshoot_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:bambooshoot'}, rarity = 1},
		{items = {'farming:bambooshoot'}, rarity = 3},
		{items = {'farming:seed_bambooshoot'}, rarity = 1},
		{items = {'farming:seed_bambooshoot'}, rarity = 3},
	}
}
minetest.register_node("farming:bambooshoot_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:bambooshoot"] = {
	crop = "farming:bambooshoot",
	seed = "farming:seed_bambooshoot",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:bambooshoot",
	burntime = 1,
})
