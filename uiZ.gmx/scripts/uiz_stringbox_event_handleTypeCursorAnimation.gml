///handle type cursor animation
if (hasselection=false and typing=true) then{//draw selector
    //calculate alpha animation
    count += uiz_sc(countspeed);
    if count >= 1 then {
        count = 0
    }
    if count < 0.5 then {
        var anim = uiz_animation_getfunction(count * 2, typeanimationin)
    } else {
        var anim = 1 - uiz_animation_getfunction((count - 0.5) * 2, typeanimationout)
    }
 uiz_typecursor_setalpha(anim*alpha); 
 uiz_typecursor_register(typepos_dis_px,iy,typepos_dis_px,ily,cursorcolor,cursorwidth)  
}
