extends AIActions


class_name MoveActAI


static func frontest_open_dir(c : Character) -> Vector2:
	var dir : Vector2 = Vector2.RIGHT.rotated(c.global_rotation)
	var mtl : int = c.motion_test_length
	var mtd : int = c.motion_test_degrees
# warning-ignore:integer_division
	var size : int = 360 / mtd
	var rot : float = 0
	
	if motion_test(c, rot, mtl): return dir
	
# warning-ignore:integer_division
	for i in (size/2):
		rot = deg2rad(mtd * (i+1))
		if motion_test(c, rot, mtl): return dir.rotated(rot)
		rot = deg2rad(mtd * -(i+1))
		if motion_test(c, rot, mtl): return dir.rotated(rot)
	
# warning-ignore:integer_division
	rot = deg2rad(mtd * (size/2))
	if motion_test(c, rot, mtl): return dir.rotated(rot)
	
	return Vector2.ZERO


static func motion_test(c : Character, rotation : float, motion_test_length : int) -> bool:
	rotation = c.global_rotation + rotation
	var motion : Vector2 = Vector2.RIGHT.rotated(rotation) * motion_test_length
	return not c.test_motion(motion, false)
