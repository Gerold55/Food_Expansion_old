minetest.register_craftitem("farming:mortar_pestle", {
	description = ("Mortar & Pestle"),
	inventory_image = "farming_mortar_pestle.png",
})

minetest.register_craft({
	output = 'farming:mortar_pestle',
	recipe = {
		{"", "",  "",},
		{"default:stone", "default:stick",  "default:stone",},
		{"", "default:stone", ""},
	}
})
