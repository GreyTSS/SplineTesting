var _mx = getMouseCoordX();
var _my = getMouseCoordY();
if(getPoint(_mx, _my) == noone) {
	setPoint(_mx, _my)
	show_debug_message($"Point Set! {_mx},{_my}")
} else {
	removePoint(_mx, _my)
	show_debug_message($"Point Removed! {_mx},{_my}")
}

