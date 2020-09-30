extends Analyser


class_name MoveCtlAnalyser


static func direction(c : Character) -> Vector2:
	var dir : Vector2 = Vector2.ZERO
	var md : Vector2 = move_dir(c)
	
	if c.move_state == System.MoveState.LOOK_DEPENDENT:
		dir.x = -c.md.y
		dir = dir.rotated(c.rotation)
		
	elif c.camera.rotating:
		dir = md.rotated(c.rotation + deg2rad(90))
		
	else:
		dir = md
		
	
	return dir

