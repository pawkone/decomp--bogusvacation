global.rooms = [];

for (var i = 0; room_exists(i); i++)
    global.rooms[i] = room_get_name(i);

function meta_goto_room()
{
    return 
    {
        arguments: ["room", "door"],
        suggestions: [global.rooms, ["A", "B", "C", "D", "E", "S"]],
        description: "teleports player into specified room."
    };
}

function sh_goto_room(arg0)
{
    with (obj_player1)
    {
        targetRoom = asset_get_index(arg0[1]);
        targetDoor = arg0[2];
        hallway = false;
        
        with (instance_create_depth(x, y, 0, obj_fadeout))
            targetRoom = other.targetRoom;
    }
}

function meta_toggle_collisions()
{
    return 
    {
        arguments: ["bool"],
        suggestions: [["true", "false"]],
        description: "toggles collisions"
    };
}

function sh_toggle_collisions(arg0)
{
    if (arg0[1] == "true")
        global.showcollisions = true;
    else if (arg0[1] == "false")
        global.showcollisions = false;
    else if (!is_bool(arg0[1]))
        global.showcollisions = !global.showcollisions;
}
