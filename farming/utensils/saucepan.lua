minetest.register_craftitem("farming:saucepan", {
	description = ("Saucepan"),
	inventory_image = "farming_saucepan.png",
})

minetest.register_craft({
	output = 'farming:saucepan',
	recipe = {
		{"default:brick", "",  "",},
		{"", "default:stick",  "",},
		{"", "", ""},
	}
})
