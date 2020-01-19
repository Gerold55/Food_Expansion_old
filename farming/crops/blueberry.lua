
local S = farming.intllib

-- blueberry seeds
minetest.register_craftitem("farming:blueberries", {
	description = S("Blueberry"),
	inventory_image = "farming_blueberries.png",
	wield_image = "farming_blueberries.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	on_use = minetest.item_eat(1),
	groups = {food_blueberry = 1, flammable = 2},
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:blueberry_1")
	end,
})

-- blueberry muffin (thanks to sosogirl123 @ deviantart.com for muffin image)



-- Blueberry Pie



-- blueberry_pepper definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_blueberry_1.png"},
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
minetest.register_node("farming:blueberry_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_blueberry_2.png"}
minetest.register_node("farming:blueberry_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_blueberry_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:blueberries'}, rarity = 2},
		{items = {'farming:seed_blueberry'}, rarity = 1},
	}
}
minetest.register_node("farming:blueberry_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_blueberry_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:blueberries'}, rarity = 1},
		{items = {'farming:blueberries'}, rarity = 3},
		{items = {'farming:seed_blueberry'}, rarity = 1},
		{items = {'farming:seed_blueberry'}, rarity = 3},
	}
}
minetest.register_node("farming:blueberry_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:blueberries"] = {
	crop = "farming:blueberries",
	seed = "farming:seed_blueberry",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:blueberries",
	burntime = 1,
})
