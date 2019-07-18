
local S = farming.intllib

-- sisal seeds
minetest.register_node("farming:seed_sisal", {
	description = S("Sisal Seed"),
	tiles = {"farming_sisal_seed.png"},
	inventory_image = "farming_sisal_seed.png",
	wield_image = "farming_sisal_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:sisal_1")
	end,
})

-- harvested sisal
minetest.register_craftitem("farming:sisal_leaf", {
	description = S("Sisal Leaf"),
	inventory_image = "farming_sisal_leaf.png",
})

-- hemp oil
minetest.register_node("farming:sisal_oil", {
	description = S("Bottle of Hemp Oil"),
	drawtype = "plantlike",
	tiles = {"farming_hemp_oil.png"},
	inventory_image = "farming_hemp_oil.png",
	wield_image = "farming_hemp_oil.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {food_oil = 1, vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "farming:hemp_oil",
	recipe = {
		{"farming:hemp_leaf", "farming:hemp_leaf", "farming:hemp_leaf"},
		{"farming:hemp_leaf", "farming:hemp_leaf", "farming:hemp_leaf"},
		{"", "vessels:glass_bottle", ""}
	}
})

minetest.register_craft( {
	output = "farming:hemp_oil",
	recipe = {
		{"farming:seed_hemp", "farming:seed_hemp", "farming:seed_hemp"},
		{"farming:seed_hemp", "farming:seed_hemp", "farming:seed_hemp"},
		{"farming:seed_hemp", "vessels:glass_bottle", "farming:seed_hemp"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:hemp_oil",
	burntime = 20,
	replacements = {{ "farming:hemp_oil", "vessels:glass_bottle"}}
})

-- hemp fibre
minetest.register_craftitem("farming:sisal_fibre", { 
	description = S("Sisal Fibre"),
	inventory_image = "farming_sisal_fibre.png",
})

minetest.register_craft( {
	output = "farming:sisal_fibre 8",
	recipe = {
		{"farming:sisal_leaf", "farming:sisal_leaf", "farming:sisal_leaf"},
		{"farming:sisal_leaf", "bucket:bucket_water", "farming:sisal_leaf"},
		{"farming:sisal_leaf", "farming:sisal_leaf", "farming:sisal_leaf"}
	},
	replacements = {{ "bucket:bucket_water", "bucket:bucket_empty"}}
})

minetest.register_craft( {
	output = "farming:sisal_fibre 8",
	recipe = {
		{"farming:sisal_leaf", "farming:sisal_leaf", "farming:sisal_leaf"},
		{"farming:sisal_leaf", "bucket:bucket_river_water", "farming:sisal_leaf"},
		{"farming:sisal_leaf", "farming:sisal_leaf", "farming:sisal_leaf"}
	},
	replacements = {{ "bucket:bucket_river_water", "bucket:bucket_empty"}}
})

-- hemp block
minetest.register_node("farming:sisal_block", {
	description = S("Sisal Block"),
	tiles = {"farming_sisal_block.png"},
	paramtype = "light",
	groups = {snappy = 1, oddly_breakable_by_hand = 1, flammable = 2}
})

minetest.register_craft( {
	output = "farming:sisal_block",
	recipe = {
		{"farming:sisal_fibre", "farming:sisal_fibre", "farming:sisal_fibre"},
		{"farming:sisal_fibre", "farming:sisal_fibre", "farming:sisal_fibre"},
		{"farming:sisal_fibre", "farming:sisal_fibre", "farming:sisal_fibre"}
	},
})

-- check and register stairs
if minetest.global_exists("stairs") then

	if stairs.mod and stairs.mod == "redo" then

		stairs.register_all("sisal_block", "farming:sisal_block",
			{snappy = 1, flammable = 2},
			{"farming_sisal_block.png"},
			"Hemp Block",
			default.node_sound_leaves_defaults())
	else

		stairs.register_stair_and_slab("sisal_block", "farming:sisal_block",
			{snappy = 1, flammable = 2},
			{"farming_sisal_block.png"},
			"Sisal Block Stair",
			"Sisal Block Slab",
			default.node_sound_leaves_defaults())
	end
end

-- paper
minetest.register_craft( {
	output = "default:paper",
	recipe = {
		{"farming:sisal_fibre", "farming:sisal_fibre", "farming:sisal_fibre"},
	}
})

-- string
minetest.register_craft( {
	output = "farming:cotton",
	recipe = {
		{"farming:sisal_fibre"},
		{"farming:sisal_fibre"},
		{"farming:sisal_fibre"},
	}
})

-- hemp rope
minetest.register_node("farming:sisal_rope", {
	description = S("Sisal Rope"),
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	tiles = {"farming_sisal_rope.png"},
	wield_image = "farming_sisal_rope.png",
	inventory_image = "farming_sisal_rope.png",
	drawtype = "plantlike",
	groups = {flammable = 2, choppy = 3, oddly_breakable_by_hand = 3},
	sounds =  default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
})

-- string
minetest.register_craft( {
	output = "farming:sisal_rope 6",
	recipe = {
		{"farming:sisal_fibre", "farming:sisal_fibre", "farming:sisal_fibre"},
		{"farming:cotton", "farming:cotton", "farming:cotton"},
		{"farming:sisal_fibre", "farming:sisal_fibre", "farming:sisal_fibre"},
	}
})

-- hemp definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_sisal_1.png"},
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
minetest.register_node("farming:sisal_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_sisal_2.png"}
minetest.register_node("farming:sisal_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_sisal_3.png"}
minetest.register_node("farming:sisal_3", table.copy(crop_def))

-- stage 8 (final)
crop_def.tiles = {"farming_sisal_4.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:sisal_leaf 2'}, rarity = 1},
		{items = {'farming:sisal_leaf'}, rarity = 2},
		{items = {'farming:seed_sisal'}, rarity = 1},
		{items = {'farming:seed_sisal'}, rarity = 2},
	}
}
minetest.register_node("farming:sisal_4", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:sisal"] = {
	crop = "farming:sisal",
	seed = "farming:seed_sisal",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
