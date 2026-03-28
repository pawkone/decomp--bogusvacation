var _sel = selected;
var m = menus[menu];
var opt = m.options;
var _length = array_length(opt);

for (var q = 0; q < array_length(backgrounds); q++)
{
    draw_sprite_tiled_ext(spr_optionsBG, backgrounds[q].index, backgrounds[q].scroll, backgrounds[q].scroll, 1, 1, c_white, backgrounds[q].alpha);
    
    if (q != 0)
        backgrounds[q].alpha = approach(backgrounds[q].alpha, (menu == backgrounds[q].men) ? 1 : 0, 0.1);
    
    backgrounds[q].scroll += 1;
}

switch (m.anchor)
{
    case states.fork:
        var xx = 640;
        var yy = 360 - ((m.ypad * _length) / 2);
        
        for (var i = 0; i < _length; i++)
        {
            var q = opt[i];
            draw_set_font(global.bigfont);
            draw_set_align(1);
            draw_set_color((_sel == i) ? c_white : c_gray);
            fekles_draw_text(xx, yy + (m.ypad * i), q.name);
        }
        
        break;
    
    case states.wallslide:
        var xx = 256;
        var yy = 360 - ((m.ypad * _length) / 2);
        
        for (var i = 0; i < _length; i++)
        {
            var q = opt[i];
            
            switch (q.type)
            {
                case states.walljump:
                    draw_set_font(global.bigfont);
                    draw_set_align(0);
                    draw_set_color((_sel == i) ? c_white : c_gray);
                    fekles_draw_text(xx, yy + (m.ypad * i), q.name);
                    break;
                
                case states.capepound:
                    draw_set_font(global.bigfont);
                    draw_set_align(0);
                    draw_set_color((_sel == i) ? c_white : c_gray);
                    draw_text(xx, yy + (m.ypad * i), q.name);
                    draw_set_align(2);
                    fekles_draw_text(1280 - xx, yy + (m.ypad * i), q.toggle[q.val]);
                    break;
                
                case states.bounce:
                    draw_set_font(global.bigfont);
                    draw_set_align(0);
                    draw_set_color((_sel == i) ? c_white : c_gray);
                    fekles_draw_text(xx, yy + (m.ypad * i), q.name);
                    draw_set_align(2);
                    fekles_draw_text(1280 - xx, yy + (m.ypad * i), q.val);
                    break;
                
                case states.hurt:
                    draw_set_font(global.bigfont);
                    draw_set_align(0);
                    draw_set_color((_sel == i) ? c_white : c_gray);
                    fekles_draw_text(xx, yy + (m.ypad * i), q.name);
                    draw_set_align(2);
                    var _key = "[&]";
                    
                    if (string_length(scr_numtokey(q.val)) == 1)
                        _key = string("[{0}]", scr_numtokey(q.val));
                    
                    fekles_draw_text(1280 - xx, yy + (m.ypad * i), q.selecting ? "PRESS ANY KEY" : _key, scr_keyspecial_index(scr_numtokey(q.val)));
                    break;
            }
        }
        
        break;
}

draw_set_color(c_white);
m = menus[menu];

if (m.menuid == states.cape)
{
    draw_set_font(global.bigfont);
    draw_set_align(0);
    draw_set_color(c_white);
    fekles_draw_text(100, 620, "F1 RESET");
}
