function getMouseCoords() {
	var _mx = mouse_x
	var _my = mouse_y
	
	_mx = clamp((_mx - global.gridData.borderW) / global.gridData.scale, 0, global.gridData.size.w)
	_my = clamp(((-1*_my) + global.gridData.rH - global.gridData.borderH) / global.gridData.scale, 0, global.gridData.size.h)
	
	return {x: round(_mx), y: round(_my)}
	
}