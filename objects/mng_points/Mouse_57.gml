if(draggingOrbit == false) {
	var _pt = getMousePoint()
	if(selected != noone && _pt != noone && _pt != selected) {
		var _len = array_length(global.splines);
		var exists = false;
		var index = -1;
		for(var i = 0; i < _len; i++) {
			if(!is_array(global.splines[i])) continue;
			if(array_contains(global.splines[i], _pt)) {
				exists = true;
				break;
			} else if array_contains(global.splines[i], selected) {
				index = i;
			}
		
		}
	
		if(!exists) {
			var _spline = noone
			if(index = -1) {
				_spline = new Spline().addPoint(selected)
				array_push(global.splines, _spline)
			} else {
				_spline = global.splines[index]
			}
			_spline.addPoint(_pt)
		
			selected = _pt
		}
	} else {
		var _mx = getMouseCoordX();
		var _my = getMouseCoordY();
		if(getMousePoint() == noone) {
			setPoint(_mx, _my)
			show_debug_message($"Point Set! {_mx},{_my}")
		} else {
			removePoint(_mx, _my)
			show_debug_message($"Point Removed! {_mx},{_my}")
		}
	}
} else {
	draggingOrbit = false;
	
	
}

