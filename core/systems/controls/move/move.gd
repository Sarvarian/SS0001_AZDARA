extends System


class_name MoveCtl

static func process(character : Character, delta : float) -> void:
	var dir : Vector2 = MoveCtlAnalyser.direction(character)
	if dir.length_squared() > 1: dir = dir.normalized()
	var vel : Vector2 = dir * character.speed * character.speed_filter * delta
	character.apply_central_impulse(vel)

