global.grid = array_create_ext(global.gridData.size.w div global.gridData.scale, function() {
	return array_create(global.gridData.size.h div global.gridData.scale, noone)
})

setPoint(12, 12, {x:12, y:12})
setPoint(4,14,{x:4,y:14})
selected = noone;