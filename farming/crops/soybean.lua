
local S = farming.intllib

-- soybean seeds
minetest.register_node("farming:seed_soybean", {
	description = S("Soy Bean Seed"),
	tiles = {"farming_soybean_seed.png"},
	inventory_image = "farming_soybean_seed.png",
	wield_image = "farming_soybean_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:soybean_1")
	end,
})

-- harvested soybean
minetest.register_craftitem("farming:soybean", {
	description = S("Soy Beans"),
	inventory_image = "farming_soybean.png",
	groups = {food_soybean = 1, flammable = 2},
})

-- soybean definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_soybean_1.png"},
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
minetest.register_node("farming:soybean_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_soybean_2.png"}
minetest.register_node("farming:soybean_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_soybean_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:soybean'}, rarity = 2},
		{items = {'farming:seed_soybean'}, rarity = 1},
	}
}
minetest.register_node("farming:soybean_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_soybean_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:soybean'}, rarity = 1},
		{items = {'farming:soybean'}, rarity = 3},
		{items = {'farming:seed_soybean'}, rarity = 1},
		{items = {'farming:seed_soybean'}, rarity = 3},
	}
}
minetest.register_node("farming:soybean_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:soybean"] = {
	crop = "farming:soybean",
	seed = "farming:seed_soybean",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:soybean",
	burntime = 1,
})

minetest.register_craftitem("farming:tofu_silken", {
	description = S("Silken Tofu"),
	inventory_image = "farming_tofu_silken.png",
	groups = {food_soybean = 1, flammable = 2},
})

minetest.register_craftitem("farming:tofu_firm", {
	description = S("Firm Tofu"),
	inventory_image = "farming_tofu_firm.png",
	groups = {food_soybean = 1, flammable = 2},
})

minetest.register_craftitem("farming:milk_soy", {
	description = S("Soy Milk"),
	inventory_image = "farming_milk_soy.png",
	groups = {food_soybean = 1, flammable = 2},
})