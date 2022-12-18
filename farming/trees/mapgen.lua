
-- decoration function
local function register_plant(name, min, max, spawnon, spawnby, num, rarety)

	-- do not place on mapgen if no value given (or not true)
	if not rarety then
		return
	end

	-- set rarety value or default to farming.rarety if not a number
	rarety = tonumber(rarety) or farming.rarety

	minetest.register_decoration({
		deco_type = "simple",
		place_on = spawnon or {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = rarety,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_min = min,
		y_max = max,
		decoration = "farming:" .. name,
		spawn_by = spawnby,
		num_spawn_by = num
	})
end


-- add crops to mapgen
register_plant("gardenwindy", 15, 40, nil, "", -1, farming.garden_windy)

if minetest.get_mapgen_setting("mg_name") == "v6" then

	register_plant("gardenwindy", 1, 20, nil, "group:water", 1, farming.garden_windy)
else
	-- v7 maps have a beach so plants growing near water is limited to 6 high
	register_plant("gardenwindy", 1, 6, nil, "", -1, farming.garden_windy)
end

if farming.garden_windy then
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = tonumber(farming.garden_windy) or farming.rarety,
		spread = {x = 100, y = 100, z = 100},
		seed = 760,
		octaves = 3,
		persist = 0.6
	},
	y_min = 5,
	y_max = 35,
	decoration = {"farming:gardenwindy"},
	spawn_by = "group:tree",
	num_spawn_by = 1
})
end
