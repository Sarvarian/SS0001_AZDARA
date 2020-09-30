extends System


class_name Analyser


static func move_dir(c : Character) -> Vector2:
	if c.move_persist_dir != Vector2.ZERO:
		return c.move_persist_dir
	else:
		return c.move_dir


static func look_dir(c : Character) -> Vector2:
	if c.look_persist_dir != Vector2.ZERO:
		return c.look_persist_dir
	else:
		return c.look_dir


