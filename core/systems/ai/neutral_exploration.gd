extends AI


class_name NeutralExplorationAI


static func process(c : Character) -> bool:
	
	if c.look_state != System.LookState.FORWARD:
		c.look_state = System.LookState.FORWARD
		return true
	
	var dir : Vector2 = MoveActAI.frontest_open_dir(c)
	if dir != Vector2.ZERO:
		c.move_persist_dir = dir
		c.look_persist_dir = dir
		return true
	
	return false
