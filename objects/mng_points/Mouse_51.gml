if(draggingOrbit == false) {
	var _pt = getMousePoint();
	if(_pt == selected && selected != noone) draggingOrbit = true;
	show_debug_message("true")
} else {
	if(is_instanceof(selected, Point)) {
		show_debug_message("true")
		selected.setDir(point_direction( getMouseCoordX(), getMouseCoordY(),selected.x, selected.y));
		selected.setMag(point_distance(selected.x, selected.y, getMouseCoordX(), getMouseCoordY()));
		selected.updateSpline()
	} else {
		show_debug_message("false")
	}
}

