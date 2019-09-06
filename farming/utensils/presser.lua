--
-- presser for mintest: a device which turns water (in buckets) into ice
-- And does a couple of other tricks, discovering which is left as a pleasant
-- surprise for the player.
--

-- enable extra popsicle types provided there are both vessels and fruits/veggies available
-- fruit + glass -> juice; juice @ presser -> popsicle + empty glass
 
--
-- Formspecs
--

local function active_formspec(fuel_percent, item_percent)
	local formspec = 
		"size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[current_name;src;2.5,1;1,1;]"..
		"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
		"list[current_name;dst;4.75,0.96;3,2;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[current_name;dst]"..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
	return formspec
end

local inactive_formspec =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;src;2.5,1.5;1,1;]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;4.75,0.96;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)

--
-- Node callback functions that are the same for active and inactive presser
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("dst") and inv:is_empty("src")
end

	      
local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

	      
local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

	      
local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

	      
local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

	      
local function presser_node_timer(pos, elapsed)
	--
	-- Inizialize metadata
	--
	local meta = minetest.get_meta(pos)

	local src_time = meta:get_float("src_time") or 0


	local inv = meta:get_inventory()
	local srclist = inv:get_list("src")

	local dstlist = inv:get_list("dst")
	
	
	--
	-- Cooking
	--

	-- takes both regular and river water
	if inv:contains_item("src", "farming:blackberries")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "farming:blackberries")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:juice_blackberry") 
	      end
	end
	
	if inv:contains_item("src", "farming:blueberries")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "farming:blueberries")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:juice_blueberry") 
	      end
	end
	
	if inv:contains_item("src", "farming:raspberries")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "farming:raspberries")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:juice_blueberry") 
	      end
	end
	
	if inv:contains_item("src", "default:apple")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "default:apple")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:juice_apple") 
	      end
	end
	
	if inv:contains_item("src", "farming:cactusfruit")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "farming:cactusfruit")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:juice_cactusfruit") 
	      end
	end
	
	if inv:contains_item("src", "farming:carrot")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "farming:carrot")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:juice_carrot") 
	      end
	end
	
	if inv:contains_item("src", "farming:grapes")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "farming:grapes")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:juice_grapes") 
	      end
	end
	
	if inv:contains_item("src", "farming:greengrapes")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "farming:greengrapes")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:juice_grape") 
	      end
	end
	
	if inv:contains_item("src", "farming:soybean")then
		if inv:room_for_item("dst", "farming:bait_fruit") then
			inv:remove_item("src", "farming:soybean")
			inv:add_item("dst", "farming:bait_fruit")
			inv:add_item("dst", "farming:milk_soy") 
	      end
	end
	
	if inv:contains_item("src", "farming:milk_soy")then
			inv:remove_item("src", "farming:milk_soy")
			inv:add_item("dst", "farming:tofu_silken") 
	end
	
	if inv:contains_item("src", "farming:tofu_silken")then
			inv:remove_item("src", "farming:tofu_silken")
			inv:add_item("dst", "farming:tofu_firm") 
	end

	
	-- Check if we have cookable content
	return
end

	      
--
-- Node definitions
--

minetest.register_node("farming:presser", {
	description = "Presser",
	tiles = {
		"pressertop.png",
		"apiarytop.png",
		"presserside.png",
		"presserside.png",
		"presserside.png",
		"presserfront.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 2, tubedevice = 1, tubedevice_receiver = 1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	tube = (function() if minetest.get_modpath("pipeworks") then return {
		-- using a different stack from defaut when inserting
		insert_object = function(pos, node, stack, direction)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			local timer = minetest.get_node_timer(pos)
			if not timer:is_started() then
				timer:start(1.0)
			end
			return inv:add_item("src", stack)
		end,
		can_insert = function(pos,node,stack,direction)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			return inv:room_for_item("src", stack)
		end,
		-- the default stack, from which objects will be taken
		input_inventory = "dst",
		connect_sides = {left = 1, right = 1, back = 1, front = 1, bottom = 1, top = 1}
	} end end)(),
	                                     
	can_dig = can_dig,

	on_timer = presser_node_timer,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", inactive_formspec)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('dst', 6)
	end,

	on_metadata_inventory_move = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether presser will work or not.
		local timer = minetest.get_node_timer(pos)
		timer:start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "src", drops)
		default.get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "presser:presser"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})
	      
minetest.register_craft({
      output = "default:snowblock 3",
      type = "shapeless",
      recipe = {
	 "default:ice"
      }
})