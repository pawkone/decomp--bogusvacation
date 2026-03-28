music = -4;
music_details = ds_list_create();
muID = -4;
currentmusic = "";
prevmuID = muID;
lock = false;
pitch = 1;

function music_add(arg0, arg1, arg2 = -4)
{
    var _mu = 
    {
        roomtoset: arg0,
        music: 
        {
            regular: arg1
        },
        func: arg2
    };
    ds_list_add(music_details, _mu);
    return _mu;
}

function music_stop()
{
    with (obj_music)
    {
        if (event_isplaying(music))
        {
            fmod_event_stop(music, false);
            music = -4;
        }
    }
}

music_add(rm_levelselect, -4);
music_add("junk", "event:/Music/junk");
music_add("overgrown", "event:/Music/zone");
func = -4;
