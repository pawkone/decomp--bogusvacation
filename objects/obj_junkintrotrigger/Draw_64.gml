draw_set_font(global.bigfont);
draw_set_align(1);
draw_set_color(c_white);

if (intro_snd != -4)
    draw_text(640, 360, fmod_event_getTimelinePosition(intro_snd));
