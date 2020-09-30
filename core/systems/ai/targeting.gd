extends AI


class_name TargetingAI


static func process(c : Character) -> bool:
	# Phase One
	if not c.p_closest_body_on_sight && not c.o_last_target_on_sight_position:
		return false
	
	if not c.p_target_on_sight == c.p_closest_body_on_sight:
		c.p_target_on_sight = c.p_closest_body_on_sight
		return true
	
	# Phase Two
#	if not :
#		return false
	
	if not c.look_target == c.o_last_target_on_sight_position:
		c.look_target = c.o_last_target_on_sight_position
		return true
	
	return false
