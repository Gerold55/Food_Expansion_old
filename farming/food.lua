
local S = farming.intllib

--= Sugar


--= Salt



--= Rose Water



--= Turkish Delight


--= Garlic Bread


--= Donuts (thanks to Bockwurst for making the donut images)





--= Porridge Oats


--= Jaffa Cake

--= Foobar
minetest.register_craftitem("farming:foobar", {
	description = S("Foobar"),
	inventory_image = "farming_foobar.png",
	groups = {food_agave = 1, flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:foobar",
	recipe = {
		"farming:dirt", "bucket:bucket_water"
	},
	replacements = {{"group:bucket_empty", "bucket:bucket_empty"}},
})
