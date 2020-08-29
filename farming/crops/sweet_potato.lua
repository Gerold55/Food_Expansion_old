local S = farming.intllib

-- sweet potato
minetest.register_craftitem("farming:sweet_potato", {
	description = S("Sweet Potato"),
	inventory_image = "farming_sweetpotato.png",
	groups = {food_veggie = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:sweet_potato_1")
	end,
})

-- baked sweet potato
minetest.register_craftitem("farming:baked_sweet_potato", {
	description = S("Baked Sweet Potato"),
	inventory_image = "farming_sweet_potato_baked.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:baked_sweet_potato",
	recipe = "farming:sweet_potato"
})


-- sweet potato definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_potato_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
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
minetest.register_node("farming:sweet_potato_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_sweet_potato_crop1.png"}
minetest.register_node("farming:sweet_potato_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_sweet_potato_crop2.png"}
crop_def.drop = {
	items = {
		{items = {'farming:sweet_potato'}, rarity = 1},
		{items = {'farming:sweet_potato'}, rarity = 3},
	}
}
minetest.register_node("farming:sweet_potato_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_sweet_potato_crop3.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:sweet_potato 2'}, rarity = 1},
		{items = {'farming:sweet_potato 3'}, rarity = 2},
	}
}
minetest.register_node("farming:sweet_potato_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:sweet_potato"] = {
	crop = "farming:sweet_potato",
	seed = "farming:sweet_potato",
	minlight = 13,
	maxlight = 15,
	steps = 4
}
