textx = approach(textx, target, 30);

if (textx == 340)
    waittimer = approach(waittimer, 0, 1);

if (waittimer <= 0)
    target = 2560;

if (textx == 2560)
    instance_destroy();
