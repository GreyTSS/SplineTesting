

global.gridData = {
	scale:   10,
	rW:      room_width,
	rH:      room_height,
	borderW: 80,
	borderH: 80,
	origin:  {x: 0, y: 0},
	size:    {w: 0, h: 0}
};

global.gridData.borderW += global.gridData.rW mod global.gridData.scale;
global.gridData.borderH += global.gridData.rH mod global.gridData.scale;
global.gridData.origin.x = global.gridData.borderW;
global.gridData.origin.y = global.gridData.rH - global.gridData.borderH;
global.gridData.size.w   = global.gridData.rW - global.gridData.borderW;
global.gridData.size.h   = global.gridData.rH - global.gridData.borderH;

/*
var _pts = instance_create_depth(x,y,depth-1,mng_points)
global.managers = {
	points: _pts
}
