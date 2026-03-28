draw_set_font(global.bigfont);
draw_set_align(1);

if (showing)
{
    var spacing = 12;
    var xx = 640;
    var yy = 620;
    fekles_draw_text(xx, yy, string_upper(text));
}
