var page = selected[1];
var sel = selected[0];
draw_set_font(global.bigfont);
draw_set_align(1);
fekles_draw_text(640, 260 - scrollY, "CHOOSE A LEVEL");

for (var i = 0; i < array_length(levels[page]); i++)
{
    draw_set_color((selected[0] == i) ? c_white : c_gray);
    fekles_draw_text(640, (360 + (40 * i)) - scrollY, string_upper(levels[page][i].title));
}

draw_set_color(c_white);
fekles_draw_text(640, 570, string_upper(string("Page {0} Out of {1}", page + 1, array_length(levels))));
draw_set_color(c_red);
var _checkpoint = string("{0} Checkpoints", levels[page][sel].title);

if (load_quick(true, _checkpoint, "general_currentroom") != -4)
{
    draw_set_align(2);
    fekles_draw_text(914.2857142857143, 670, "[C] DELETE CHECKPOINT DATA");
}

draw_set_color(c_white);
