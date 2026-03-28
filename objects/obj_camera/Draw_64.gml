if (!ds_list_empty(collectables))
{
    for (var i = 0; i < ds_list_size(collectables); i++)
    {
        var q = ds_list_find_value(collectables, i);
        
        with (q)
            draw_sprite_ext(sprite_index, 4, x, y, 1, 1, 0, c_white, 1);
    }
}

for (var i = 0; i < global.hp; i++)
    draw_sprite(get_sprite_name("hud_health"), i, 45 + (56 * i), 64 + (sin((current_time / 115) - (i * 60.5)) * 3));

var spdx = 6;
var spry = 96;
draw_sprite_part(spr_hud_speedometer_meter, noiseindex, 0, 0, 4 + (barpos * 229), 64, spdx + 16, spry + 16);
draw_sprite(spr_hud_speedometer_front, 0, spdx, spry);
draw_sprite(noisesprite, noiseindex, spdx + 32 + (barpos * 194), spry + 20);
draw_sprite(cuphud, 0, cupx, cupy);
draw_set_align(2);
draw_set_font(cupfont);
draw_text(313 + (56 * (global.hp - 4)), 12 + cupoffset + 32 + 4, collect);
draw_set_align(2);
draw_set_font(Font1);
var _msec = wrap(global.timer, 0, 59);
var _mseconds = _msec;

if (_msec < 10)
    _mseconds = string("0{0}", _msec);

var _sec = wrap(global.timer / 60, 0, 59);
var _seconds = _sec;

if (_sec < 10)
    _seconds = string("0{0}", _sec);

var _minutes = wrap(global.timer / 3600, 0, 59);
var _timer = string("{2}:{1}.{0}", _mseconds, _seconds, _minutes);

if (global.timervisible)
    draw_text(1230, 680, _timer);
