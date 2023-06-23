minetest.register_node("farming:gardenwindy", {
	description = "Windy Garden",
	drawtype = "plantlike",
	tiles = {"garden_windy.png"},
	inventory_image = {"garden_windy.png"},
	wield_image = {"garden_windy.png"},
	waving = 1,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
	},
	drop = {items = {{items = {'farming:seed_tomato'}, rarity = 1},
		   {items = {'farming:seed_tomato'}, rarity = 2},
		   {items = {'farming:seed_tomato'}, rarity = 3},
		   {items = {'farming:seeds_cucumber'}, rarity = 1},
		   {items = {'farming:seeds_cucumber'}, rarity = 2},
		   {items = {'farming:seeds_cucumber'}, rarity = 3},
		   {items = {'farming:seed_cotton'}, rarity = 1},
		   {items = {'farming:seed_cotton'}, rarity = 2},
		   {items = {'farming:seed_cotton'}, rarity = 3},
		   {items = {'farming:garlic_clove'}, rarity = 1},
		   {items = {'farming:garlic_clove'}, rarity = 2},
		   {items = {'farming:garlic_clove'}, rarity = 3},
		   {items = {'farming:seed_corn'}, rarity = 1},
		   {items = {'farming:seed_corn'}, rarity = 2},
		   {items = {'farming:seed_corn'}, rarity = 3},
		   {items = {'farming:seed_mustard'}, rarity = 1},
		   {items = {'farming:seed_mustard'}, rarity = 2},
		   {items = {'farming:seed_mustard'}, rarity = 3},
		   {items = {'farming:seed_cabbage'}, rarity = 1},
		   {items = {'farming:seed_cabbage'}, rarity = 2},
		   {items = {'farming:seed_cabbage'}, rarity = 3},
		   {items = {'farming:leek_seeds'}, rarity = 1},
		   {items = {'farming:leek_seeds'}, rarity = 2},
		   {items = {'farming:leek_seeds'}, rarity = 3}}},
})

minetest.register_decoration({
		name = "farming:gardenwindy",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.035,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 30,
		y_min = 1,
		decoration = "farming:gardenwindy",
		param2 = 4,
	})
	
	
minetest.register_node("farming:cattails", {
	description = "Cattail",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "ws_cattail_bottom.png", tileable_vertical = true}},
	inventory_image = "ws_cattail_roots.png",
	wield_image = "ws_cattail_roots.png",
	paramtype = "light",
	paramtype2 = "leveled",
	use_texture_alpha = "blend",
	groups = {snappy = 3},
	walkable = false,
	-- instantly replace with sandy dirt
	node_dig_prediction = "default:sand",
	-- do not place clientside
	node_placement_prediction = "",
	spawn_by = "default:water_source",
		num_spawn_by = 1,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- Call on_rightclick if the pointed node defines it
		if pointed_thing.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = minetest.get_node(pointed_thing.under)
			local def_ptu = minetest.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
					itemstack, pointed_thing)
			end
		end

		-- only place on sandy dirt
		local pos = pointed_thing.under
		if minetest.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		local pos_top = pointed_thing.above
		local player_name = placer:get_player_name()

		if not minetest.is_protected(pos, player_name) and
				not minetest.is_protected(pos_top, player_name) then
			minetest.set_node(pos, {name = "farming:cattails",
                param2 = 16})
			if not (creative and creative.is_enabled_for
					and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end
		else
			minetest.chat_send_player(player_name, "Node is protected")
			minetest.record_protection_violation(pos, player_name)
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		-- replace with sandy dirt
		minetest.set_node(pos, {name = "default:sand"})
	end,
	on_construct = function(pos)
		-- give it a top
		local above = vector.new(pos)
		above.y = above.y + 2
		minetest.set_node(above, {name = "farming:cattail_top"})
	end,
})

minetest.register_node("farming:cattail_top", {
	description = "Cattail",
	drawtype = "plantlike",
	use_texture_alpha = "blend",
	waving = 1,
	paramtype = "light",
	tiles = {"ws_cattail_top.png"},
	inventory_image = "ws_cattail.png",
	groups = {snappy = 3, not_in_creative_inventory = 1},
	walkable = false,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),
	selection_box = {
		type = "fixed",
		fixed = {
				{-4/16,-0.5, -4/16, 4/16, 0.5, 4/16},
		},
	},
})
	
minetest.register_decoration({
		name = "farming:cattails",
		deco_type = "simple",
		place_on = {"default:sand"},
		use_texture_alpha = "blend",
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		y_max = 0,
		y_min = 0,
		decoration = "farming:cattails",
		spawn_by = "default:water_source",
		num_spawn_by = -1,
	})