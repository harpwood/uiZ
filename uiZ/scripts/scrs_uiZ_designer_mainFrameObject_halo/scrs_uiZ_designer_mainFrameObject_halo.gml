function obj_uiZ_designer_drawHalo(object){
	var rx = object.rx;
	var ry = object.ry;
	var rlx = object.rlx;
	var rly = object.rly;
	var width = object.width;
	var height = object.height;
	draw_set_color(c_white);

	thickness=5
	stripes=10

	var sw=width/(stripes*2-1)
	var sh=height/(stripes*2-1)
	var sa=(sw+sh)/2
	var stripesw=round(width/sa)
	var stripesh=round(height/sa)
	sw=width/(stripesw-1)
	sh=height/(stripesh-1)
	//draw lines in width
	if sw*stripesw+sw>width then{stripesw-=1}
	for(var i=0;i<stripesw;i+=2){
	draw_line_width(rx+sw*i,ry,rx+sw*i+sw,ry,thickness)
	draw_line_width(rx+sw*i,rly,rx+sw*i+sw,rly,thickness)
	}
	//draw lines in height
	if sh*stripesh+sh>height then{stripesh-=1}
	for(var i=0;i<stripesh;i+=2){
	draw_line_width(rx,ry+sh*i,rx,ry+sh*i+sh,thickness)
	draw_line_width(rlx,ry+sh*i,rlx,ry+sh*i+sh,thickness)
	}
	//draw text
	uiz_textmiddle()
	//draw_text(rx+width/2,ry+height/2,name)
	uiz_textmiddle_topleft()

	//top left corner
	draw_circle(rx,ry,thickness/2,0)
	//top right corner
	draw_circle(rlx,ry,thickness/2,0)
	//bottom left corner
	draw_circle(rx,rly,thickness/2,0)
	//bottom right corner
	draw_circle(rlx,rly,thickness/2,0)
	var bsz=max(min((width+height)/2*uiz_dp/2000,uiz_dp*0.3),10)
	var outsx=0;
	var outsy=0;
	if width<bsz*2 then{outsx=bsz}
	if height<bsz*2 then{outsy=bsz}
	//now draw the risize buttons
	//var snapToResize = 0;
	uiz_draw_squareButton_independent(rlx-bsz+outsx,rly-bsz+outsy,rlx+outsx,rly+outsy,c_white,c_gray,c_black,1)
	uiz_draw_squareButton_independent(rx-outsx,ry-outsy,rx+bsz-outsx,ry+bsz-outsy,c_white,c_gray,c_black,1)
	uiz_draw_squareButton_independent(rlx-bsz+outsx,ry-outsy,rlx+outsx,ry+bsz-outsy,c_white,c_gray,c_black,1)
	uiz_draw_squareButton_independent(rx-outsx,rly-bsz+outsy,rx+bsz-outsx,rly+outsy,c_white,c_gray,c_black,1)
	uiz_draw_squareButton_independent(rlx-bsz+outsx,ry+height/2-bsz/2,rlx+outsx,ry+height/2+bsz/2,c_white,c_gray,c_black,1)
	uiz_draw_squareButton_independent(rx-outsx,ry+height/2-bsz/2,rx+bsz-outsx,ry+height/2+bsz/2,c_white,c_gray,c_black,1)
	uiz_draw_squareButton_independent(rx+width/2-bsz/2,ry-outsy,rx+width/2+bsz/2,ry+bsz-outsy,c_white,c_gray,c_black,1)
	uiz_draw_squareButton_independent(rx+width/2-bsz/2,rly-bsz+outsy,rx+width/2+bsz/2,rly+outsy,c_white,c_gray,c_black,1)
	//if mouse_check_button(mb_left) and point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx,ry,rlx,rly) and !point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx+thickness,ry+thickness,rlx-thickness,rly-thickness) and global.mousefrozen=0 then{snapToResize=9; global.mousefrozen=1}else{if snapToResize=9 and !mouse_check_button(mb_left) then{snapToResize=0; global.mousefrozen=0}}
	//if !uiz_postypeisvariable(object.posinframex) and (snapToResize>=1 and snaptopresize<=7) then{snapToResize=0;}
	/*
	switch(snapToResize){
	case 1: uiz_des_update_wh() break;//bottom-right
	case 2: uiz_des_update_whxy() break;//top-left
	case 3: uiz_des_update_why() break;//top-right
	case 4: uiz_des_update_whx() break;//bottom-left
	case 5: switch(setpointx){case uiz_right: uiz_des_update_wr()break; case uiz_middle: uiz_des_update_wm() break;default:uiz_des_update_w()break;} break;//right
	//case 5: uiz_des_update_w() break;//right
	case 6: switch(setpointx){case uiz_right: uiz_des_update_xr()break; case uiz_middle: uiz_des_update_xm() break;default:uiz_des_update_wx()break;} break;//left
	//case 6: uiz_des_update_wx() break;//left
	case 7: switch(setpointy){case uiz_bottom: uiz_des_update_hr()break; case uiz_middle: uiz_des_update_hm() break;default:uiz_des_update_hy()break;} break;//top
	//case 7: uiz_des_update_hy() break;//top
	case 8: switch(setpointy){case uiz_bottom: uiz_des_update_yr()break; case uiz_middle: uiz_des_update_ym() break;default:uiz_des_update_h()break;} break;//bottom
	//case 8: uiz_des_update_h() break;//bottom
	case 9: uiz_des_update_xy() break;//moveing
	}
	if snapToResize>0 then{uiz_fixchildren(object,1)}
	*/
}

function obj_uiZ_designer_checkHaloMouse(object){
	var rx = object.rx;
	var ry = object.ry;
	var rlx = object.rlx;
	var rly = object.rly;
	var width = object.width;
	var height = object.height;
	var bsz=max(min((width+height)/2*uiz_dp/2000,uiz_dp*0.3),10)
	var outsx=0;
	var outsy=0;
	if width<bsz*2 then{outsx=bsz}
	if height<bsz*2 then{outsy=bsz}
	snapToObjectRx = uiz_getmouse_x();
	snapToObjectRy = uiz_getmouse_y();
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rlx-bsz+outsx,rly-bsz+outsy,rlx+outsx,rly+outsy) then{snapToResize=1; global.mousefrozen=1; return true}
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx-outsx,ry-outsy,rx+bsz-outsx,ry+bsz-outsy) then{snapToResize=2; global.mousefrozen=1; return true}
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rlx-bsz+outsx,ry-outsy,rlx+outsx,ry+bsz-outsy) then{snapToResize=3; global.mousefrozen=1; return true}
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx-outsx,rly-bsz+outsy,rx+bsz-outsx,rly+outsy) then{snapToResize=4; global.mousefrozen=1; return true}
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rlx-bsz+outsx,ry+height/2-bsz/2,rlx+outsx,ry+height/2+bsz/2) then{snapToResize=5; global.mousefrozen=1; return true}
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx-outsx,ry+height/2-bsz/2,rx+bsz-outsx,ry+height/2+bsz/2) then{snapToResize=6; global.mousefrozen=1; return true}
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx+width/2-bsz/2,ry-outsy,rx+width/2+bsz/2,ry+bsz-outsy) then{snapToResize=7; global.mousefrozen=1; return true}
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx+width/2-bsz/2,rly-bsz+outsy,rx+width/2+bsz/2,rly+outsy) then{snapToResize=8; global.mousefrozen=1; return true}
	if point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx,ry,rlx,rly) and !point_in_rectangle(uiz_getmouse_x(),uiz_getmouse_y(),rx+thickness,ry+thickness,rlx-thickness,rly-thickness) then{snapToResize=9; global.mousefrozen=1; return true}
	return (snapToResize>0);
}

function obj_uiZ_designer_handleHaloMouse(object){
	switch(snapToResize){
		case 1: uiz_des_update_w(object); uiz_des_update_h(object); break;//bottom-right
		case 2: uiz_des_update_x(object); uiz_des_update_y(object); break;//top-left
		case 3: uiz_des_update_w(object); uiz_des_update_y(object); break;//top-right
		case 4: uiz_des_update_x(object); uiz_des_update_h(object); break;//bottom-left
		case 5: uiz_des_update_w(object); break;//right
		case 6: uiz_des_update_x(object); break;//left
		case 7: uiz_des_update_y(object); break;//top
		case 8: uiz_des_update_h(object); break;//bottom
		case 9: uiz_des_update_xy(object) break;//moveing
	}
	uiz_fixgeneralpos(object);
	uiz_fixChildren(object, true);
}