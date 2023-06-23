local fruit_names = {"cherry","pomegranate","peach","apricot","cinnamon","apple","avocado","fig","breadfruit","banana","almond","cashew","date","dragonfruit","durian","guava","hazelnut","grapefruit","gooseberry","jackfruit","coconut","candlenut","lemon","lime","lychee","olives","nutmeg","maple","mango","orange","papaya","passionfruit","pecan","persimmon","pistachio","plum","rambutan","soursop","starfruit","tamarind","vanillabean","walnut","peppeprcorn","pawpaw","paperbark","spiderweb","orange","grapes"}
for k,v in ipairs(fruit_names)do 

minetest.register_node("farming:apple", {
	description = "Apple",
	drawtype = "plantlike",
	tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:cherry",{
    description = "Cherry",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
	on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:avocado",{
    description = "Avocado",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
	on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:pear",{
    description = "Pear",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
	on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:kiwi",{
    description = "Kiwi",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
	on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:lemon",{
    description = "Lemon",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1}
})

minetest.register_craftitem("farming:cinnamon",{
    description = "Cinnamon",
    inventory_image = "cinnamon.png"
})

minetest.register_node("farming:coconut",{
    description = "Coconut",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1}
})

minetest.register_node("farming:orange",{
    description = "Orange",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:olives",{
    description = "Olives",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:pomegranate",{
    description = "Pomegranate",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:apricot",{
    description = "Apricot",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:pear",{
    description = "Pear",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:mango",{
    description = "Mango",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:banana",{
    description = "Bananas",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:grapes",{
    description = "Grapes",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_node("farming:pecan",{
    description = "Pecan",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

end