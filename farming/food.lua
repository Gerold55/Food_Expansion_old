
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
	groups = {food_pork = 1},
})

--= Pepperoni
minetest.register_craftitem("farming:pepperoni", {
	description = S("Pepperoni"),
	inventory_image = "farming_pepperoni.png",
})

--= Cheese
minetest.register_craftitem("farming:cheese", {
	description = S("Cheese"),
	inventory_image = "farming_cheese.png",
})

minetest.register_craft({
	output = "farming:cheese",
	recipe = {
		{"farming:pot", "group:food_milk", ""},
		{"farming:salt", "", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:pot", "farming:pot"}},
	replacements = {{ "farming:soy_milk", "vessels:glass_bottle"}}
})


--= Cheese Slice
minetest.register_craftitem("farming:cheese_slice", {
	description = S("Cheese Slice"),
	inventory_image = "farming_cheese_slice.png",
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
		"farming:dirt", "bucket:bucket_water"
	},
	replacements = {{"group:bucket_empty", "bucket:bucket_empty"}},
})

--= Tofu
minetest.register_craftitem("farming:tofu_silken", {
	description = S("Silken Tofu"),
	inventory_image = "farming_tofu_silken.png",
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
	output = "farming:tofacon_raw 5",
	recipe = {
		{"farming:cutting_board", "farming:tofu_firm", "farming:cooking_oil"},
		{"farming:salt", "farming:flour", "group:food_sugar"},
		{"", "", ""},
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}}
})

minetest.register_craftitem("farming:tofacon_cooked", {
	description = S("Cooked Tofacon"),
	inventory_image = "farming_tofacon_cooked.png",
	groups = {food_pork = 1},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 4,
	output = "farming:tofacon_cooked",
	recipe = "farming:tofacon_raw"
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
	description = S("BBQ Pulled Pork"),
	inventory_image = "farming_bbq_pulled_pork.png",
})

minetest.register_craft({
	output = "farming:pork_bbq",
	recipe = {
		{"farming:cutting_board", "farming:tofacon_cooked", "farming:bun"},
		{"farming:tomato", "farming:spice_leaf", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:cutting_board", "farming:pot"}},
})

minetest.register_craftitem("farming:burger_cheeseburger", {
	description = S("Cheeseburger"),
	inventory_image = "farming_cheeseburger.png",
})

minetest.register_craft({
	output = "farming:burger_cheeseburger",
	recipe = {
		{"farming:burger_ham", "group:food_cheese", ""},
		{"", "", ""},
		{"", "", ""},
	},
})

minetest.register_craftitem("farming:burger_ham", {
	description = S("Hamburger"),
	inventory_image = "farming_hamburger.png",
})

minetest.register_craft({
	output = "farming:burger_ham",
	recipe = {
		{"farming:skillet", "group:food_meat", ""},
		{"farming:bun", "", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:skillet", "farming:skillet"}},
})



--= Sugar
minetest.register_craftitem("farming:sugar", {
	description = S("Sugar"),
	inventory_image = "farming_sugar.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:sugar",
	recipe = {
		"default:papyrus"
	}
})