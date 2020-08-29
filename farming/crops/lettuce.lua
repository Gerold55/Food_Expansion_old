
local S = farming.intllib

-- lettuce
minetest.register_craftitem("farming:lettuce", {
	description = S("Lettuce"),
	inventory_image = "farming_lettuce.png",
	wield_image = "farming_lettuce.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	on_use = minetest.item_eat(1),
	groups = {food_lettuce = 1, flammable = 2},
})

-- lettuce seeds
minetest.register_node("farming:seed_lettuce", {
	description = S("Lettuce Seeds"),
	tiles = {"farming_seeds_lettuce.png"},
	inventory_image = "farming_seeds_lettuce.png",
	wield_image = "farming_seeds_lettuce.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:lettuce_1")
	end,
})

-- blueberry muffin (thanks to sosogirl123 @ deviantart.com for muffin image)


-- Blueberry Pie



-- blueberry_pepper definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_lettuce_crop_0.png"},
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
minetest.register_node("farming:lettuce_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_lettuce_crop_1.png"}
crop_def.drop = {
	items = {
		{items = {'farming:lettuce'}, rarity = 2},
		{items = {'farming:seed_lettuce'}, rarity = 1},
	}
}
minetest.register_node("farming:lettuce_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_lettuce_crop_2.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:lettuce'}, rarity = 1},
		{items = {'farming:lettuce'}, rarity = 3},
		{items = {'farming:seed_lettuce'}, rarity = 1},
		{items = {'farming:seed_lettuce'}, rarity = 3},
	}
}
minetest.register_node("farming:lettuce_3", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:lettuce"] = {
	crop = "farming:lettuce",
	seed = "farming:seed_lettuce",
	minlight = 13,
	maxlight = 15,
	steps = 7
}