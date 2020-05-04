
old_expansion.particles_leafdrop = function(pos)
    minetest.add_particlespawner({
        amount = 6,
        time = 3,

        minpos = pos,
        maxpos = {x=pos.x, y=pos.y -1, z=pos.z},
        minvel = {x=0, y=-1, z=0},
        maxvel = {x=0, y=-1, z=0},
        minacc = {x=0, y=0, z=0},
        maxacc = {x=0, y=0, z=0},
        minexptime = 1,
        maxexptime = 2,
        minsize = 1,
        maxsize = 1,

        collisiondetection = false,

        collision_removal = false,

        attached = ObjectRef,

        vertical = false,

        texture = "leaf.png",

        glow = 0

    })
end
--  --  --  --  --  --  --  UTIL    --  --  --  --  --  --  --  
--[[old_expansion.clear_metas = function()
end]]

old_expansion.tree_rand = function()
        math.random();
        local num = math.random(135)
        local s;
        if(num <= 25 and num >= 0)then
            s = old_expansion.schems.schem_poplar
        elseif(num <= 52 and num >= 26)then
            s = old_expansion.schems.schem_will
        elseif(num <= 89 and num >= 53)then
            s = old_expansion.schems.schem_trop
        elseif(num <= 135 and num >= 90)then
            s = old_expansion.schems.schem_conif
        else end
        return s
    end
