extends System


class_name CharacterSys


static func process(plrs : Array, npcs : Array, delta : float) -> void: 
	for p in plrs:
		if not p: return
		if p.is_dead: return
		ActionCtl.process(p, p.index)
	
	for c in plrs + npcs:
		if not c: return
		if c.is_dead: continue
		MoveCtl.process(c, delta)
		LookCtl.process(c, delta)
		reset_data(c)


static func reset_data(character : Character) -> void:
	character.move_dir = Vector2.ZERO
	character.look_dir = Vector2.ZERO
	character.speed_filter = 1
