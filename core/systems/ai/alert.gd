extends AI


class_name AlertAI


static func process(c : Character) -> bool:
	if not c.o_last_target_on_sight_position:
		return false
	
	if not c.look_state == System.LookState.TARGET:
		c.look_state = System.LookState.TARGET
		return true
	
	if not c.move_persist_dir == Vector2.ZERO:
		c.move_persist_dir = Vector2.ZERO
		return true
	
	if not c.look_persist_dir == Vector2.ZERO:
		c.look_persist_dir = Vector2.ZERO
		return true
	
	return true
