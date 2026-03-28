buffer = 0;
backgrounds = [];
array_push(backgrounds, 
{
    index: 0,
    alpha: 1,
    scroll: 0,
    men: 0
});
array_push(backgrounds, 
{
    index: 1,
    alpha: 0,
    scroll: 0,
    men: 1
});
array_push(backgrounds, 
{
    index: 2,
    alpha: 0,
    scroll: 0,
    men: 2
});
array_push(backgrounds, 
{
    index: 3,
    alpha: 0,
    scroll: 0,
    men: 3
});
array_push(backgrounds, 
{
    index: 4,
    alpha: 0,
    scroll: 0,
    men: 4
});
array_push(backgrounds, 
{
    index: 4,
    alpha: 0,
    scroll: 0,
    men: 5
});
menu = 0;
menus = [];
selected = 0;

create_menu = function(arg0, arg1, arg2, arg3)
{
    var _opt = 
    {
        menuid: arg0,
        anchor: arg1,
        ypad: arg2,
        options: [],
        backfunc: arg3
    };
    return _opt;
};

add_option_ext = function(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = 0, arg6 = ["OFF", "ON"])
{
    var q = 
    {
        name: arg2,
        func: arg3,
        val: arg4,
        toggle: arg6,
        type: arg1,
        max: arg5,
        selecting: false
    };
    array_push(arg0.options, q);
    return q;
};

goto_menu = function(arg0)
{
    for (var i = 0; i < array_length(menus); i++)
    {
        var m = menus[i];
        
        if (m.menuid == arg0)
            menu = i;
    }
    
    selected = 0;
};

var _main = create_menu(states.normal, states.fork, 48, function()
{
    instance_destroy();
    obj_pause.pause = true;
});
add_option_ext(_main, states.walljump, "AUDIO", function()
{
    goto_menu(states.jump);
});
add_option_ext(_main, states.walljump, "VIDEO", function()
{
    goto_menu(states.running);
});
add_option_ext(_main, states.walljump, "GAME", function()
{
    goto_menu(states.runningjump);
});
add_option_ext(_main, states.walljump, "CONTROLS", function()
{
    goto_menu(states.skidding);
});
array_push(menus, _main);
var _audio = create_menu(states.jump, states.wallslide, 48, function()
{
    goto_menu(states.normal);
});
add_option_ext(_audio, states.walljump, "BACK", function()
{
    goto_menu(states.normal);
});
add_option_ext(_audio, states.bounce, "MASTER", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    global.MasterVolume = q.val / 100;
    q.val = global.MasterVolume * 100;
}, global.MasterVolume * 100, 100);
add_option_ext(_audio, states.bounce, "MUSIC", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    global.MusicVolume = q.val / 100;
    q.val = global.MusicVolume * 100;
}, global.MusicVolume * 100, 100);
add_option_ext(_audio, states.bounce, "SFX", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    global.SfxVolume = q.val / 100;
    q.val = global.SfxVolume * 100;
}, global.SfxVolume * 100, 100);
add_option_ext(_audio, states.capepound, "UNFOCUSED MUTE", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    global.unfocusedmute = q.val;
    q.val = global.unfocusedmute;
}, global.unfocusedmute, 1);
array_push(menus, _audio);
var _video = create_menu(states.running, states.wallslide, 48, function()
{
    goto_menu(states.normal);
});
add_option_ext(_video, states.walljump, "BACK", function()
{
    goto_menu(states.normal);
});
add_option_ext(_video, states.capepound, "FULLSCREEN", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    window_set_fullscreen(q.val);
    q.val = window_get_fullscreen();
}, window_get_fullscreen(), 1);
add_option_ext(_video, states.capepound, "RESOLUTION", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    var res = [[960, 540], [1280, 720]];
    window_set_size(res[q.val][0], res[q.val][1]);
}, 1, 1, ["960 X 540", "1280 X 720"]);
array_push(menus, _video);
var _game = create_menu(states.runningjump, states.wallslide, 48, function()
{
    goto_menu(states.normal);
});
add_option_ext(_game, states.walljump, "BACK", function()
{
    goto_menu(states.normal);
});
add_option_ext(_game, states.capepound, "TIMER", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    global.timervisible = q.val;
    q.val = global.timervisible;
}, global.timervisible, 1, ["OFF", "PER LEVEL"]);
array_push(menus, _game);
var _control_main = create_menu(states.skidding, states.wallslide, 48, function()
{
    goto_menu(states.normal);
});
add_option_ext(_control_main, states.walljump, "BACK", function()
{
    goto_menu(states.normal);
});
add_option_ext(_control_main, states.walljump, "KEYBOARD", function()
{
    goto_menu(states.cape);
});
array_push(menus, _control_main);
var _control_key = create_menu(states.cape, states.wallslide, 48, function()
{
    goto_menu(states.skidding);
});
add_option_ext(_control_key, states.walljump, "BACK", function()
{
    goto_menu(states.skidding);
});
add_option_ext(_control_key, states.hurt, "START", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    scr_setbind(global.key_start, "Start", q.val);
    q.val = global.key_start[0];
}, global.key_start[0], 1);
add_option_ext(_control_key, states.hurt, "LEFT", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    scr_setbind(global.key_left, "Left", q.val);
    q.val = global.key_left[0];
}, global.key_left[0], 1);
add_option_ext(_control_key, states.hurt, "DOWN", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    scr_setbind(global.key_down, "Down", q.val);
    q.val = global.key_down[0];
}, global.key_down[0], 1);
add_option_ext(_control_key, states.hurt, "UP", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    scr_setbind(global.key_up, "Up", q.val);
    q.val = global.key_up[0];
}, global.key_up[0], 1);
add_option_ext(_control_key, states.hurt, "RIGHT", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    scr_setbind(global.key_right, "Right", q.val);
    q.val = global.key_right[0];
}, global.key_right[0], 1);
add_option_ext(_control_key, states.hurt, "JUMP", function()
{
    var m = menus[menu];
    var opt = m.options;
    var q = opt[selected];
    scr_setbind(global.key_jump, "Jump", q.val);
    q.val = global.key_jump[0];
}, global.key_jump[0], 1);
array_push(menus, _control_key);
