function __ti_initinput()
{
    ini_open("options.ini");
    global.key_left = [ini_read_real("Keyboard", "Left", 37), ini_read_real("Controller", "Left", 32783)];
    global.key_up = [ini_read_real("Keyboard", "Up", 38), ini_read_real("Controller", "Up", 32781)];
    global.key_down = [ini_read_real("Keyboard", "Down", 40), ini_read_real("Controller", "Down", 32782)];
    global.key_right = [ini_read_real("Keyboard", "Right", 39), ini_read_real("Controller", "Right", 32784)];
    global.key_jump = [ini_read_real("Keyboard", "Jump", 90), ini_read_real("Controller", "Jump", 32769)];
    global.key_attack = [ini_read_real("Keyboard", "Attack", 16), ini_read_real("Controller", "Attack", 32775)];
    global.key_slap = [ini_read_real("Keyboard", "Slap", 88), ini_read_real("Controller", "Slap", 32770)];
    global.key_taunt = [ini_read_real("Keyboard", "Taunt", 67), ini_read_real("Controller", "Taunt", 32771)];
    global.key_start = [ini_read_real("Keyboard", "Start", 27), ini_read_real("Controller", "Start", 32778)];
    ini_close();
}

function scr_setbind(arg0, arg1, arg2, arg3 = 0)
{
    var _key = (arg3 == 0) ? "Keyboard" : "Controller";
    ini_open("options.ini");
    ini_write_real(_key, arg1, arg2);
    arg0[arg3] = ini_read_real(_key, arg1, arg2);
    ini_close();
}

function __ti_input()
{
    var _input = obj_inputcontroller.player_input[0];
    ini_open("options.ini");
    key_left = -(keyboard_check(global.key_left[0]) || gamepad_button_check(_input, global.key_left[1]) || gamepad_axis_value(_input, gp_axislh) < 0);
    key_left2 = -(keyboard_check_pressed(global.key_left[0]) || gamepad_button_check_pressed(_input, global.key_left[1]) || gamepad_axis_value(_input, gp_axislh) < 0);
    key_right = keyboard_check(global.key_right[0]) || gamepad_button_check(_input, global.key_right[1] || gamepad_axis_value(_input, gp_axislh) > 0);
    key_right2 = keyboard_check_pressed(global.key_right[0]) || gamepad_button_check_pressed(_input, global.key_right[1] || gamepad_axis_value(_input, gp_axislh) > 0);
    key_down = keyboard_check(global.key_down[0]) || gamepad_button_check(_input, global.key_down[1] || gamepad_axis_value(_input, gp_axislv) > 0.5);
    key_down2 = keyboard_check_pressed(global.key_down[0]) || gamepad_button_check_pressed(_input, global.key_down[1] || gamepad_axis_value(_input, gp_axislv) > 0.5);
    key_up = keyboard_check(global.key_up[0]) || gamepad_button_check(_input, global.key_up[1] || gamepad_axis_value(_input, gp_axislv) < 0.5);
    key_up2 = keyboard_check_pressed(global.key_up[0]) || gamepad_button_check_pressed(_input, global.key_up[1] || gamepad_axis_value(_input, gp_axislv) < 0.5);
    key_jump = keyboard_check(global.key_jump[0]) || gamepad_button_check(_input, global.key_jump[1]);
    key_jump2 = keyboard_check_pressed(global.key_jump[0]) || gamepad_button_check_pressed(_input, global.key_jump[1]);
    key_slap = keyboard_check(global.key_slap[0]) || gamepad_button_check(_input, global.key_slap[1]);
    key_slap2 = keyboard_check_pressed(global.key_slap[0]) || gamepad_button_check_pressed(_input, global.key_slap[1]);
    key_attack = keyboard_check(global.key_attack[0]) || gamepad_button_check(_input, global.key_attack[1]);
    key_attack2 = keyboard_check_pressed(global.key_attack[0]) || gamepad_button_check_pressed(_input, global.key_attack[1]);
    key_taunt = keyboard_check(global.key_taunt[0]) || gamepad_button_check(_input, global.key_taunt[1]);
    key_taunt2 = keyboard_check_pressed(global.key_taunt[0]) || gamepad_button_check_pressed(_input, global.key_taunt[1]);
    key_start = keyboard_check(global.key_start[0]) || gamepad_button_check(_input, global.key_start[1]);
    key_start2 = keyboard_check_pressed(global.key_start[0]) || gamepad_button_check_pressed(_input, global.key_start[1]);
    ini_close();
}

function fekles_draw_text(arg0, arg1, arg2)
{
    var alignments = [draw_get_halign(), draw_get_valign()];
    var _font = draw_get_font();
    var _color = draw_get_color();
    var _xx = arg0;
    var _yy = arg1;
    var _cx = 0;
    var _cy = 0;
    var _length = string_length(arg2) + 1;
    var _final_string = "";
    var index = 1;
    draw_set_font(_font);
    
    for (var i = 1; i < _length; i++)
    {
        var _is_special = false;
        var _is_key = false;
        var _let = string_char_at(arg2, i);
        var _final_let = string_char_at(arg2, i);
        var _width = string_width(_let);
        
        if (string_char_at(arg2, i - 1) == "/" || string_char_at(arg2, i) == "/")
            _is_special = true;
        
        if (string_char_at(arg2, i) == "[" || string_char_at(arg2, i) == "]")
            _is_special = true;
        
        if (string_char_at(arg2, i - 1) == "[" && string_char_at(arg2, i + 1) == "]")
            _is_key = true;
        
        if (!_is_special)
            _final_string += _let;
        
        switch (alignments[0])
        {
            case 0:
                break;
            
            case 1:
                _xx = arg0 - (string_width(arg2) / 2);
                break;
            
            case 2:
                _xx = arg0 - string_width(arg2);
                break;
        }
        
        if (_is_special == false)
        {
            if (_let == "&")
            {
                draw_sprite(spr_tutorialkeyspecial, argument3, (_xx + _cx) - 32, _yy + _cy + 8);
            }
            else
            {
                draw_set_halign(fa_left);
                
                if (_is_key)
                {
                    draw_sprite(spr_tutorialkey, 0, (_xx + _cx) - 8, _yy + _cy + 8);
                    draw_set_color(c_black);
                    draw_set_font(global.tutorialfont);
                }
                
                draw_text(_xx + _cx, _yy + _cy, _final_let);
            }
            
            _cx += _width;
            index += 1;
        }
        else
        {
            switch (_let)
            {
                case "n":
                    _cx = 0;
                    _cy += string_height("A");
                    _final_string = "";
                    index = 1;
                    break;
            }
        }
        
        draw_set_halign(alignments[0]);
        draw_set_font(_font);
        draw_set_color(_color);
    }
}

function gamepad_check_any(arg0)
{
    for (var i = 32769; i < 32788; i++)
    {
        if (gamepad_button_check(arg0, i))
            return true;
    }
}

function approach(arg0, arg1, arg2)
{
    if (arg0 < arg1)
        return min(arg0 + arg2, arg1);
    else
        return max(arg0 - arg2, arg1);
}

function to_bool(arg0)
{
    var _return = "false";
    
    if (arg0 == true)
        _return = "true";
    
    return _return;
}

function scr_soundeffect_2d(arg0, arg1 = 0)
{
    var _s = audio_play_sound(arg0, 0, false);
    audio_sound_pitch(_s, 1 + arg1);
}

function scr_soundeffect_3d(arg0, arg1, arg2, arg3 = 0)
{
    var _s = audio_play_sound_at(arg0, -arg1, arg2, 0, 300, 2560, 3, false, 0);
    audio_sound_pitch(_s, 1 + arg3);
}

function animation_end()
{
    return floor(image_index) >= (image_number - 1);
}

function draw_set_align(arg0 = 0, arg1 = 0)
{
    draw_set_halign(arg0);
    draw_set_valign(arg1);
}

function error_exists(arg0)
{
    var _proceed = false;
    
    if (!ds_list_empty(obj_errorreporter.errors))
    {
        for (var i = 0; i < ds_list_size(obj_errorreporter.errors); i++)
        {
            var q = ds_list_find_value(obj_errorreporter.errors, i);
            
            if (q.rtxt == arg0)
            {
                _proceed = true;
                break;
            }
        }
    }
    
    return _proceed;
}

function add_error(arg0)
{
    var _err = 
    {
        rtxt: arg0,
        txt: string("ERROR: {0}", arg0),
        timer: 180
    };
    ds_list_add(obj_errorreporter.errors, _err);
    return _err;
}

function save_quick(arg0, arg1)
{
    with (obj_savesystem)
    {
        for (var i = 0; i < array_length(arg1); i++)
        {
            ini_open(file);
            
            if (is_string(arg1[i].val))
                ini_write_string(arg0, arg1[i].name, arg1[i].val);
            else
                ini_write_real(arg0, arg1[i].name, arg1[i].val);
        }
        
        ini_close();
        saveicon.timer = 60;
    }
}

function load_quick(arg0 = true, arg1, arg2)
{
    with (obj_savesystem)
    {
        ini_open(file);
        return arg0 ? real(ini_read_real(arg1, arg2, -4)) : ini_read_string(arg1, arg2, -4);
        ini_close();
    }
}

function wrap()
{
    var value = floor(argument0);
    var _min = floor(min(argument1, argument2));
    var _max = floor(max(argument1, argument2));
    var range = (_max - _min) + 1;
    return ((((value - _min) % range) + range) % range) + _min;
}

function scr_getkeys(arg0)
{
    var _char = ord(arg0);
    
    switch (arg0)
    {
        case 37:
            _char = "LEFT";
            break;
        
        case 39:
            _char = "RIGHT";
            break;
        
        case 38:
            _char = "UP";
            break;
        
        case 40:
            _char = "DOWN";
            break;
        
        case 16:
            _char = "SHIFT";
            break;
        
        case 32:
            _char = "SPACE";
            break;
        
        case 17:
            _char = "CONTROL";
            break;
        
        case 27:
            _char = "ESCAPE";
            break;
    }
    
    return _char;
}

function scr_keyspecial_index(arg0)
{
    switch (arg0)
    {
        case "SHIFT":
            return 0;
            break;
        
        case "CONTROL":
            return 1;
            break;
        
        case "SPACE":
            return 2;
            break;
        
        case "UP":
            return 3;
            break;
        
        case "DOWN":
            return 4;
            break;
        
        case "LEFT":
            return 6;
            break;
        
        case "RIGHT":
            return 5;
            break;
        
        case "ESCAPE":
            return 7;
            break;
    }
}

function scr_numtokey(arg0)
{
    var _realkey = 0;
    var actualkey = chr(arg0);
    
    switch (arg0)
    {
        case 38:
        case 37:
        case 27:
        case 16:
        case 32:
        case 39:
        case 40:
            _realkey = scr_getkeys(arg0);
            break;
        
        case 163:
            _realkey = "¢";
            break;
        
        case 222:
            _realkey = "'";
            break;
        
        case 186:
            _realkey = ":";
            break;
        
        case 190:
            _realkey = ".";
            break;
        
        case 188:
            _realkey = ",";
            break;
    }
    
    if (_realkey == 0)
        actualkey = chr(arg0);
    else
        actualkey = _realkey;
    
    return actualkey;
}
