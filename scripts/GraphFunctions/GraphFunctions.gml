function Spline() constructor {
	points = [];
	interpolatedPoints = [];
	detail = 40;
	
	static addPoint = function(_point) {
		_point.spline = self;
		array_push(points, _point);
		cacheHermitePoints()
		return self;
	}
	
	
	
	static draw = function() {
		for(var i = 0; i < array_length(interpolatedPoints)-1; i++) {
			var _x1 = translateGridToX(interpolatedPoints[i].x);
			var _y1 = translateGridToY(interpolatedPoints[i].y);
			var _x2 = translateGridToX(interpolatedPoints[i+1].x);
			var _y2 = translateGridToY(interpolatedPoints[i+1].y);
			draw_line(_x1,_y1,_x2, _y2)
			show_debug_message($"{_x1},{_y1},{_x2},{_y2}")
		}
		
	}
	
	
	
	static cacheHermitePoints = function() {
		interpolatedPoints = array_create(0, noone);
		for(var i = 0; i < array_length(points)-1; i++) {
			var _pts = generateHermite(points[i], points[i+1], detail)
			if(is_array(_pts)) {
				for(var e = 0; e < array_length(_pts); e++) {
					array_push(interpolatedPoints, _pts[e]);
				}
			}
		}
	}
	
	static generateHermite = function(_p1, _p2, _detail) {
		var _p1X = translateGridToX(_p1.x);
		var _p1Y = translateGridToY(_p1.y);
		var _p2X = translateGridToX(_p2.x);
		var _p2Y = translateGridToY(_p2.y)
		
		var _dist = point_distance(_p1X, _p1Y, _p2X, _p2Y);
		
		var _tMag1 = _p1.mag * _dist;
		var _tMag2 = _p2.mag * _dist;
		
		var _t1X = _tMag1 * dcos(_p1.dir);
		var _t1Y = _tMag1 * -dsin(_p1.dir);
		
		var _t2X = _tMag2 * dcos(_p2.dir);
		var _t2Y = _tMag2 * -dsin(_p2.dir);
		
		var _points = array_create(_detail+1);
		for(var i = 0; i <= _detail; i++) {
			var t = i / _detail;
			
			var t2 = t*t;
			var t3 = t2*t;
			var h00 = 2 * t3 - 3 * t2 + 1;
			var h10 =     t3 - 2 * t2 + t
			var h01 = -2 * t3 + 3 * t2;
			var h11 = t3 - t2;
			
			var rX = (h00*_p1X) + (h10*_t1X) + (h01 * _p2X) + (h11 * _t2X);
			var rY = (h00*_p1Y) + (h10*_t1Y) + (h01 * _p2Y) + (h11 * _t2Y);
			var _newPt =  new Point(translateXToGrid(rX), translateYToGrid(rY))
			show_debug_message($"Hermite {i}: x:{_newPt.x} y:{_newPt.y}")
			_points[i] = _newPt;
			
		}
		return _points
	}
	
	
	
}



function Point(_x, _y) constructor {
	x = _x;
	y = _y;
	dir = -1;
	mag = -1;
	spline = noone
	
	static setDir = function(_dir) {dir = _dir; return self;}
	static setMag = function(_mag) {mag = _mag; return self;}
	static getSpline = function() {return spline;}
	static updateSpline = function() {if(is_instanceof(spline, Spline)) {spline.cacheHermitePoints()}}
}


function getMousePoint() {
	return getPoint(getMouseCoordX(), getMouseCoordY());
}

function getMouseCoordX() {
	return  round(translateXToGrid(mouse_x))
}

function getMouseCoordY() {
	return  round(translateYToGrid(mouse_y))
}

function setPoint(x, y, val = new Point(x, y)) {
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

function translateGridToX(x) {
	return(x * global.gridData.scale + global.gridData.borderW)
}

function translateGridToY(y) {
	return(global.gridData.rH - global.gridData.borderW - (y * global.gridData.scale))
	
}