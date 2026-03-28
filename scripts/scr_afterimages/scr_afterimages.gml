function create_blur_afterimage(arg0, arg1, arg2, arg3, arg4)
{
    var aft = 
    {
        sprite_index: arg0,
        image_index: arg1,
        x: arg2,
        y: arg3,
        image_xscale: arg4,
        image_blend: c_white,
        alarm: [15, 5, -2],
        type: states.jump,
        alpha: 1,
        image_alpha: 0.8
    };
    ds_list_add(obj_afterimagecontroller.afterimages, aft);
    return aft;
}
