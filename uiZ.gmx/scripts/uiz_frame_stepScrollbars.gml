var c = false;
/***************************************************
      scrollbars mouseover
     ***************************************************/
     if snapm=false and snapk=false then{
        if scrollx = true and scrollbarx = true and mscrollbarx < 0 then {
            var scrollox = uiz_drawscrollbar_getvalue(uscrollx);
            uiz_drawscrollbar_horizontal_step(rx,ily,rlx-scrollbarcorner_x,rly, uscrollx, -mscrollbarx, false, scrollxspeed, scrollbarAnimation, scrollbarAnimationTime)
            var scrollnx = uiz_drawscrollbar_getvalue(uscrollx);
            if scrollnx != scrollox then {
                c = true;
                addx = -scrollnx;
            }
        }
        if scrolly = true and scrollbary = true and mscrollbary < 0 then {
            var scrollox = uiz_drawscrollbar_getvalue(uscrolly);
            uiz_drawscrollbar_vertical_step(ilx,ry,rlx,rly-scrollbarcorner_y, uscrolly, -mscrollbary, false, scrollxspeed, scrollbarAnimation, scrollbarAnimationTime)
    
            var scrollnx = uiz_drawscrollbar_getvalue(uscrolly);
            
            if scrollnx != scrollox then {
                c = true;
                addy = -scrollnx;
            }
        }
    }
return c;
