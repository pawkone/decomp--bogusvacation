function get_char_name(arg0)
{
    var _name = "NaN";
    
    switch (arg0)
    {
        case "N":
            _name = "noise";
            break;
        
        case "M":
            _name = "monster";
            break;
    }
    
    return _name;
}

function set_sprite(arg0, arg1 = image_index, arg2 = char)
{
    var sprite_to_find = string("spr_{0}_{1}", get_char_name(arg2), arg0);
    var sprite = asset_get_index(sprite_to_find);
    
    if (sprite_exists(sprite))
    {
        sprite_index = sprite;
        
        if (arg1 != image_index)
            image_index = arg1;
    }
    else
    {
        add_error(string("'{0}' Is not a valid sprite!", sprite_to_find));
        
        if (char == "M")
            set_sprite(arg0, arg1, "N");
    }
}

function get_sprite(arg0)
{
    var sprite_to_find = string("spr_{0}_{1}", get_char_name(char), arg0);
    var sprite = asset_get_index(sprite_to_find);
    
    if (sprite_exists(sprite))
    {
        return sprite_index == sprite;
    }
    else
    {
        add_error(string("'{0}' Is not a valid sprite!", sprite_to_find));
        
        if (char == "M")
        {
            sprite_to_find = string("spr_{0}_{1}", get_char_name("N"), arg0);
            sprite = asset_get_index(sprite_to_find);
            
            if (sprite_exists(sprite))
                return sprite_index == sprite;
        }
    }
}

function get_sprite_name(arg0)
{
    var sprite_to_find = string("spr_{0}_{1}", get_char_name(char), arg0);
    var sprite = asset_get_index(sprite_to_find);
    
    if (sprite_exists(sprite))
        return sprite;
    else
        add_error(string("'{0}' Is not a valid sprite!", sprite_to_find));
}
