
local S = farming.intllib

--= Sugar


--= Salt



--= Rose Water



--= Turkish Delight


--= Garlic Bread


--= Donuts (thanks to Bockwurst for making the donut images)





--= Porridge Oats


--= Jaffa Cake

--= Bacon
minetest.register_craftitem("farming:bacon", {
	description = S("Bacon"),
	inventory_image = "farming_bacon.png",
	groups = {food_pork = 1, food_meat_all = 1},
})

--= Pepperoni
minetest.register_craftitem("farming:pepperoni", {
	description = S("Pepperoni"),
	inventory_image = "farming_pepperoni.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:pepperoni",
	recipe = {
		"farming:cutting_board", "group:food_pork", "farming:ginger",
		"farming:pepper", "farming:salt", "",
		"", "", "",
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}},
	replacements = {{ "farming:soy_milk", "vessels:glass_bottle"}}
})


--= Cheese
minetest.register_craftitem("farming:cheese", {
	description = S("Cheese"),
	inventory_image = "farming_cheese.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:cheese",
	recipe = {
		"farming:pot", "group:food_milk", "",
		"farming:salt", "", "",
		"", "", "",
	},
	replacements = {{ "farming:pot", "farming:pot"}},
	replacements = {{ "farming:soy_milk", "vessels:glass_bottle"}}
})


--= Cheese Slice
minetest.register_craftitem("farming:cheese_slice", {
	description = S("Cheese Slice"),
	inventory_image = "farming_cheese_slice.png",
	groups = {food_cheese = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:cheese_slice 9",
	recipe = {
		"farming:cheese"
	},
})

--= Foobar
minetest.register_craftitem("farming:foobar", {
	description = S("Foobar"),
	inventory_image = "farming_foobar.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:foobar",
	recipe = {
		"default:dirt", "group:water_bucket"
	},
	replacements = {{"group:bucket_empty", "bucket:bucket_empty"}},
})

--= Breakfast
minetest.register_craftitem("farming:pancakes", {
	description = S("Pancakes"),
	inventory_image = "farming_pancakes.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:pancakes",
	recipe = {
		"farming:skillet", "farming:batter", "", 
		"group:food_milk", "", "",
		"", "", ""
	},
	replacements = {{"farming:skillet", "farming:skillet"}},
})

--= Tofu
minetest.register_craftitem("farming:tofu_silken", {
	description = S("Silken Tofu"),
	inventory_image = "farming_tofu_silken.png",
	groups = {food_heavycream = 1},
})

minetest.register_craftitem("farming:tofu_firm", {
	description = S("Firm Tofu"),
	inventory_image = "farming_tofu_firm.png",
})

minetest.register_craftitem("farming:tofacon_raw", {
	description = S("Raw Tofacon"),
	inventory_image = "farming_tofacon.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:tofacon_raw 5",
	recipe = {
		"farming:cutting_board", "farming:tofu_firm", "farming:cooking_oil",
		"farming:salt", "farming:flour", "group:food_sugar",
		"", "", "",
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}}
})

minetest.register_craftitem("farming:tofacon_cooked", {
	description = S("Cooked Tofacon"),
	inventory_image = "farming_tofacon_cooked.png",
	groups = {food_pork = 1, food_meat_all = 1},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 4,
	output = "farming:tofacon_cooked",
	recipe = "farming:tofacon_raw"
})

minetest.register_craftitem("farming:tofeak_raw", {
	description = "".. minetest.colorize("#FFFFFF", "Raw Tofeak\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_tofeak.png",
	groups = {food_meat_raw = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:tofeak_raw 6",
	recipe = {
		"farming:cutting_board", "farming:tofu_firm", "group:mushroom",
		"farming:sauce_soy", "farming:pepper_ground", "farming:cooking_oil",
		"", "", "",
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}}
})

minetest.register_craftitem("farming:tofeak_cooked", {
	description = "".. minetest.colorize("#FFFFFF", "Cooked Tofeak\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_tofeak_cooked.png",
	groups = {food_meat = 1, food_meat_all = 1},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 4,
	output = "farming:tofeak_cooked",
	recipe = "farming:tofeak_raw"
})

minetest.register_craftitem("farming:tofeeg_raw", {
	description = "".. minetest.colorize("#FFFFFF", "Raw Tofeeg\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_tofeeg_raw.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:tofeeg_raw 6",
	recipe = {
		"farming:cutting_board", "farming:tofu_firm", "",
		"dye:yellow", "", "",
		"", "", "",
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}}
})

minetest.register_craftitem("farming:tofeeg_cooked", {
	description = "".. minetest.colorize("#FFFFFF", "Cooked Tofeeg\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_tofeeg_cooked.png",
	groups = {food_egg = 1},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 4,
	output = "farming:tofeeg_cooked",
	recipe = "farming:tofeeg_raw"
})

--= Baits
minetest.register_craftitem("farming:bait_fruit", {
	description = S("Fruit Bait"),
	inventory_image = "farming_bait_fruit.png",
})

minetest.register_craftitem("farming:bait_grain", {
	description = S("Grain Bait"),
	inventory_image = "farming_bait_grain.png",
})

--= Sandwiches
minetest.register_craftitem("farming:pork_bbq", {
	description = "".. minetest.colorize("#FFFFFF", "BBQ Pulled Pork\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_bbq_pulled_pork.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:pork_bbq",
	recipe = {
		"farming:cutting_board", "farming:tofacon_cooked", "farming:bun",
		"farming:tomato", "farming:spice_leaf", "",
		"", "", "",
	},
	replacements = {{ "farming:cutting_board", "farming:pot"}},
})

minetest.register_craftitem("farming:burger_cheese", {
	description = "".. minetest.colorize("#FFFFFF", "Cheeseburger\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_cheeseburger.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:burger_cheese",
	recipe = {
		"farming:burger_ham", "group:food_cheese", "",
		"", "", "",
		"", "", "",
	},
})

minetest.register_craftitem("farming:burger_ham", {
	description = "".. minetest.colorize("#FFFFFF", "Hamburger\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_hamburger.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:burger_ham",
	recipe = {
		"farming:skillet", "group:food_meat", "",
		"farming:bun", "", "",
		"", "", "",
	},
	replacements = {{ "farming:skillet", "farming:skillet"}},
})

minetest.register_craftitem("farming:burger_deluxe", {
	description = "".. minetest.colorize("#FFFFFF", "Deluxe Burger\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_deluxeburger.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:burger_deluxe",
	recipe = {
		"farming:burger_ham", "farming:lettuce", "",
		"farming:tomato", "", "",
		"", "", ""
	},
})

--= Sugar
minetest.register_craftitem("farming:sugar", {
	description = "".. minetest.colorize("#FFFFFF", "Sugar\n")..minetest.colorize("#0026FF", "Food Expansion"),
	inventory_image = "farming_sugar.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:sugar",
	recipe = {
		"default:papyrus"
	}
})

-- juice
minetest.register_craftitem("farming:juice_grape", {
	description = S("Grape Juice"),
	inventory_image = "farming_juice_grape.png",
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	groups = {food_blueberry = 1, flammable = 2, vessel = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:juice_grape",
	type = "shapeless",
	recipe = {
		"farming:juicer", "farming:grapes", "",
		"farming:grapes", "", "",
		"", "", ""
	},
	replacements = {
		{"group:food_juicer", "farming:juicer"},
	},
})

minetest.register_craftitem("farming:juice_punch", {
	description = S("Fruit Punch"),
	inventory_image = "farming_juice_grape.png",
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	groups = {food_blueberry = 1, flammable = 2, vessel = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:juice_punch",
	type = "shapeless",
	recipe = {
		"farming:juicer", "group:fruity", "",
		"group:food_sugar", "", "",
		"", "", ""
	},
	replacements = {
		{"group:food_juicer", "farming:juicer"},
	},
})

-- soup
minetest.register_craftitem("farming:soup_stock", {
	description = S("Stock"),
	inventory_image = "farming_bone_broth.png",
	on_use = minetest.item_eat(4, "farming:bowl"),
})

minetest.register_craft({
	output = "farming:soup_stock",
	type = "shapeless",
	recipe = {
		"farming:juicer", "group:fruity", "",
		"group:food_sugar", "", "",
		"", "", ""
	},
	replacements = {
		{"group:food_juicer", "farming:juicer"},
	},
})

minetest.register_craftitem("farming:stew_hearty", {
	description = S("Hearty Stew"),
	inventory_image = "farming_hearty_stew.png",
	on_use = minetest.item_eat(4, "farming:bowl"),
})

minetest.register_craft({
	output = "farming:soup_hearty",
	type = "shapeless",
	recipe = {
		"farming:pot", "group:food_meat_all", "farming:carrot",
		"farming:flour", "farming:soup_stock", "farming:tomato",
		"farming:pepper", "farming:onion", "farming:garlic_clove"
	},
	replacements = {
		{"farming:pot", "farming:pot"},
	},
})

-- milk 

minetest.register_craftitem("farming:heavycream", {
	description = S("Heavy Cream"),
	inventory_image = "farming_heavycream.png",
	groups = {food_heavycream = 1},
})

minetest.register_craft({
	output = "farming:heavycream",
	type = "shapeless",
	recipe = {
		"farming:mixing_bowl", "group:food_milk", "",
		"", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:mixing_bowl", "farming:mixing_bowl"},
	},
})

minetest.register_craftitem("farming:butter", {
	description = S("Butter"),
	inventory_image = "farming_butter.png",
	groups = {food_heavycream = 1},
})

minetest.register_craft({
	output = "farming:butter",
	type = "shapeless",
	recipe = {
		"farming:saucepan", "group:food_heavycream", "",
		"farming:salt", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:saucepan", "farming:saucepan"},
	},
})