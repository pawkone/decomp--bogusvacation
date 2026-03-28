function scr_collision()
{
    var _ground = (place_meeting(x, y + 1, par_solid) && vsp >= 0) || ((place_meeting(x, y + 1, par_platform) && (bbox_bottom - 1) < instance_place(x, y + 1, par_platform).y) && vsp >= 0) || (place_meeting(x, y + 1, obj_slope) && vsp >= 0);
    var _checkby = 0.5;
    var _slopecheckthing = 42;
    
    if (place_meeting(x + hsp, y - 42, par_solid) && scr_sloped())
        _slopecheckthing = 16;
    
    if (place_meeting(x + hsp, y, par_solid))
    {
        if (!place_meeting(x + hsp, y - _slopecheckthing, par_solid) && (scr_sloped() || place_meeting(x + hsp, y, obj_slope)))
        {
            var i = 0;
            
            while (place_meeting(x + hsp, y, par_solid))
            {
                i++;
                y -= _checkby;
                
                if (i > 180)
                    break;
            }
        }
        else
        {
            var i = 0;
            _checkby2 = _checkby * sign(hsp);
            
            while (!place_meeting(x + _checkby2, y, par_solid))
            {
                i++;
                x += _checkby2;
                
                if (i > 180)
                    break;
            }
            
            hsp = 0;
        }
    }
    
    if (vsp >= 0 && !place_meeting(x + hsp, y + 1, par_solid) && place_meeting(x + hsp, y + (_slopecheckthing / 1.5) + vsp, par_solid) && scr_sloped(0, vsp + 1))
    {
        var i = 0;
        
        while (!place_meeting(x + hsp, y + _checkby, par_solid))
        {
            i++;
            y += _checkby;
            
            if (i > 180)
                break;
        }
    }
    
    x += hsp;
    var _checkby2 = _checkby * sign(vsp);
    
    if (place_meeting(x, y + vsp, par_solid))
    {
        var i = 0;
        
        while (!place_meeting(x, y + _checkby2, par_solid))
        {
            i++;
            y += _checkby2;
            
            if (i > 180)
                break;
        }
        
        vsp = 0;
    }
    
    if (place_meeting(x, y + vsp, par_platform))
    {
        if ((bbox_bottom - 1) < instance_place(x, y + vsp, par_platform).y && vsp >= 0)
        {
            while (!place_meeting(x, y + _checkby2, par_platform))
                y += _checkby2;
            
            vsp = 0;
        }
    }
    
    grounded = _ground;
    
    if (grounded)
        y = floor(y);
    
    y += vsp;
}

function scr_sloped(arg0 = 0, arg1 = 1)
{
    return place_meeting(x + arg0, y + arg1, obj_slope);
}

function scr_slope_get(arg0 = 0, arg1 = 1)
{
    return instance_place(x + arg0, y + arg1, obj_slope);
}

function scr_solid(arg0 = 0, arg1 = 1)
{
    return place_meeting(x + arg0, y + arg1, obj_solid);
}
