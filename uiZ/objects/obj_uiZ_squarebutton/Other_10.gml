if uiz_cntn() then{
	draw_square(rx,ry,rlx,rly,uiz_km_retval(color,oncolor,incolor),alpha)
if text!="" then{
	draw_set_alpha(textalpha*alpha)
	uiz_km_setColor(textcolor,textoncolor,textincolor)
	if font>-1 then{draw_set_font(font)}
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(rx+width*(halign/2),ry+height*(valign/2),string_hash_to_newline(uiz_getText_contained(text,width)))
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
}
if outline=1 then{
	var col = uiz_km_retval(outlinecolor,outlineoncolor,outlineincolor)
	draw_set_alpha(outlinealpha*alpha)
	//draw_rectangle(rx-1,ry-1,rlx-1,rly-1,1)
	draw_rectangle_colour(rx+1,ry+1,rlx-2,rly-2,col,col,col,col,true)
	//draw_line(rx,rly-1,rlx,rly-1);
	draw_set_color(c_white)
	draw_set_alpha(1)
}
uiz_containend()
}




