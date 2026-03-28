function scr_player_hurt()
{
    hsp = movespeed * xscale;
    
    if (grounded)
    {
        state = states.normal;
        movespeed = 0;
        set_sprite("idle", 0);
    }
}
