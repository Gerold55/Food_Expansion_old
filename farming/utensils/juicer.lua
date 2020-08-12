minetest.register_craftitem("farming:juicer", {
	description = ("Juicer"),
	inventory_image = "farming_juicer.png",
})

minetest.register_craft({
	output = 'farming:juicer',
	recipe = {
		{"", "group:stone",  "",},
		{"", "default:slab_stone", "",},
		{"", "", "",},
	}
})