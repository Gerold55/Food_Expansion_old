
local S = farming.intllib

-- cucumber seeds
minetest.register_node("farming:seeds_cucumber", {
	description = S("Cucumber Seeds"),
	tiles = {"farming_cucumber_seeds.png"},
	inventory_image = "farming_cucumber_seeds.png",
	wield_image = "farming_cucumber_seeds.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:cucumber_1")
	end,
})

-- harvested cucumber
minetest.register_craftitem("farming:cucumber", {
	description = S("Cucumber"),
	inventory_image = "farming_cucumber.png",
	groups = {food_cucumber = 1, food_type_snack = 1},
	on_use = minetest.item_eat(4),
})

-- cucumber definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_cucumber_1.png"},
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
minetest.register_node("farming:cucumber_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_cucumber_2.png"}
minetest.register_node("farming:cucumber_2", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_cucumber_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:cucumber'}, rarity = 2},
		{items = {'farming:seeds_cucumber'}, rarity = 1},
	}
}
minetest.register_node("farming:cucumber_3", table.copy(crop_def))

-- stage 7 (final)
crop_def.tiles = {"farming_cucumber_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:cucumber'}, rarity = 1},
		{items = {'farming:cucumber'}, rarity = 3},
		{items = {'farming:seeds_cucumber'}, rarity = 1},
		{items = {'farming:seeds_cucumber'}, rarity = 3},
	}
}
minetest.register_node("farming:cucumber_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:cucumber"] = {
	crop = "farming:cucumber",
	seed = "farming:seeds_cucumber",
	minlight = 13,
	maxlight = 15,
	steps = 7
}