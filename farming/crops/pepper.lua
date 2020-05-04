
local S = farming.intllib

-- pepper seeds
minetest.register_node("farming:peppercorn", {
	description = S("Peppercorn"),
	tiles = {"crops_peppercorn.png"},
	inventory_image = "crops_peppercorn.png",
	wield_image = "crops_peppercorn.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:pepper_1")
	end,
})

-- green pepper
minetest.register_craftitem("farming:pepper", {
	description = S("Pepper"),
	inventory_image = "crops_pepper_green.png",
	on_use = minetest.item_eat(2),
	groups = {food_pepper = 1, flammable = 3},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:peppercorn",
	recipe = {"farming:pepper"}
})

-- ground pepper
minetest.register_node("farming:pepper_ground", {
	description = ("Ground Pepper"),
	inventory_image = "crops_pepper_ground.png",
	wield_image = "crops_pepper_ground.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	tiles = {"crops_pepper_ground.png"},
	groups = {
		vessel = 1, food_pepper_ground = 1,
		dig_immediate = 3, attached_node = 1
	},
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
})

minetest.register_craft( {
	output = "farming:pepper_ground",
	type = "shapeless",
	recipe = {"group:food_peppercorn", "vessels:glass_bottle", "farming:mortar_pestle"},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})


-- pepper definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"crops_pepper_plant_1.png"},
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
minetest.register_node("farming:pepper_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"crops_pepper_plant_2.png"}
minetest.register_node("farming:pepper_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"crops_pepper_plant_3.png"}
crop_def.drop = {
	items = {
		{items = {'farming:pepper'}, rarity = 2},
		{items = {'farming:seed_pepper'}, rarity = 1},
	}
}
minetest.register_node("farming:pepper_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"crops_pepper_plant_4.png"}
crop_def.drop = {
	items = {
		{items = {'farming:pepper'}, rarity = 1},
		{items = {'farming:pepper'}, rarity = 3},
		{items = {'farming:seed_pepper'}, rarity = 1},
		{items = {'farming:seed_pepper'}, rarity = 3},
	}
}
minetest.register_node("farming:pepper_4", table.copy(crop_def))

-- stage5
crop_def.tiles = {"crops_pepper_plant_5.png"}
crop_def.drop = {
	items = {
		{items = {'farming:pepper'}, rarity = 1},
		{items = {'farming:pepper'}, rarity = 3},
		{items = {'farming:seed_pepper'}, rarity = 1},
		{items = {'farming:seed_pepper'}, rarity = 3},
	}
}
minetest.register_node("farming:pepper_5", table.copy(crop_def))

-- stage 6 (final)
crop_def.tiles = {"crops_pepper_plant_6.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:pepper'}, rarity = 1},
		{items = {'farming:pepper'}, rarity = 3},
		{items = {'farming:seed_pepper'}, rarity = 1},
		{items = {'farming:seed_pepper'}, rarity = 3},
	}
}
minetest.register_node("farming:pepper_6", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:pepper"] = {
	crop = "farming:pepper",
	seed = "farming:seed_pepper",
	minlight = 13,
	maxlight = 15,
	steps = 7
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:pepper",
	burntime = 1,
})
