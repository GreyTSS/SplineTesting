


function getMouseCoordX() {
	return  round(translateXToGrid(mouse_x))
}

function getMouseCoordY() {
	return  round(translateYToGrid(mouse_y))
}

function setPoint(x, y, val = {x: x, y:y}) {
	global.grid[x][y] = val;
}

function getPoint(x, y) {
	return global.grid[x][y];
}


function removePoint(x, y) {
	global.grid[x][y] = noone;
}

function translateXToGrid(x) {
	return clamp((x - global.gridData.borderW) / global.gridData.scale, 0, global.gridData.size.w)
}

function translateYToGrid(y) {	
	return clamp(((-1*y) + global.gridData.rH - global.gridData.borderH) / global.gridData.scale, 0, global.gridData.size.h)
}
