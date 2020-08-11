minetest.register_craftitem("farming:monsterflesh_raw",{
	description = "Raw Monster Flesh",
	groups = {food = 1, meaty = 1},
	inventory_image = "maultest.png",
})

minetest.register_craftitem("farming:dirt_bar",{
	description = "Dirt Bar",
	groups = {food = 1, dirty = 1},
    inventory_image = "dirt_bar.png",
    on_use = function(itemstack, user, pointed_thing)
        if(hbhunger)then
        local pl_hunger = hbhunger.hunger[user:get_player_name()]
        if(pl_hunger <= 8)then
        hbhunger.hunger[user:get_player_name()] = pl_hunger + 4
        itemstack:take_item()
        else minetest.chat_send_player(user:get_player_name(),"You cannot stomach another bite of dust!")
        end
    else end
        return itemstack
    end
})