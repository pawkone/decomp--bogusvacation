levels = [];
array_push(levels, []);
array_push(levels, []);

add_level = function(arg0, arg1, arg2, arg3 = true)
{
    array_push(levels[arg2], 
    {
        islevel: arg3,
        title: arg0,
        room_info: [arg1, "A"]
    });
};

add_level("Overgrown Zone", overgrown_1, 0);
add_level("Junkyard Beach", junk_1, 0);
add_level("Terrorist Town", roadway_1, 0);
add_level("Test", rm_test, 1);
selected = [0, 0];
active = true;
scrollY = 0;
