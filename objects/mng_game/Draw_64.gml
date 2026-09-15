draw_rectangle_color(global.gridData.borderW, 0, global.gridData.rW, global.gridData.rH-global.gridData.borderH, c_white, c_white, c_white, c_white, false);
draw_set_alpha(0.6);
draw_set_color(c_gray)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_font(fnt_pixel)
for(var i = global.gridData.origin.x; i < global.gridData.rW; i+=global.gridData.scale) {
	draw_line(i,0,i,global.gridData.rH-global.gridData.borderH)
	if(i mod 20 == 0 ) {
		draw_text(i, global.gridData.origin.y + (global.gridData.scale*.5), (i - global.gridData.origin.x) div global.gridData.scale);
	}
	
}
draw_set_halign(fa_right)
draw_set_valign(fa_middle)
for(var i = global.gridData.origin.y; i >= 0; i-=global.gridData.scale) {
	draw_line(global.gridData.origin.x, i, global.gridData.rW, i)
	if(i mod 20 == 0 ) {
		draw_text(global.gridData.origin.x-(global.gridData.scale*.5), global.gridData.origin.y-i, (i div global.gridData.scale))
	}
}
draw_set_alpha(1);