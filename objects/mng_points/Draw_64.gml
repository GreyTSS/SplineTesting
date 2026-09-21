draw_set_valign(fa_bottom)
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_font(fnt_pixel)
str = selected == noone ? "None" : ($"[{selected.x},{selected.y}]")
draw_text(20, global.gridData.rH - 40, "Mouse At: ["+string(getMouseCoordX())+","+string(getMouseCoordY())+"]!")
draw_text(20, global.gridData.rH - 20, $"Point Selected: {str}");

draw_set_color(c_green)
for(var i = 0; i < array_length(global.grid); i++) {
	for(var e = 0; e < array_length(global.grid[i]); e++) {
		if(global.grid[i][e] == noone) continue;
		else if(global.grid[i][e] == selected) draw_set_color(c_gray)
		draw_circle(global.gridData.origin.x + (global.gridData.scale*global.grid[i][e].x), global.gridData.origin.y - (global.gridData.scale*global.grid[i][e].y), global.gridData.scale * .35, false)
		draw_set_color(c_green)
	}
}
