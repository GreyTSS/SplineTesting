global.grid = array_create_ext(global.gridData.size.w div global.gridData.scale, function() {
	return array_create(global.gridData.size.h div global.gridData.scale, noone)
})

global.splines = [];

setPoint(12, 12);
setPoint(4,14);
selected = noone;
draggingOrbit = false;



