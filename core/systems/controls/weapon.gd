extends System


class_name WeaponCtl


enum {LEFT, RIGHT}


static func match_side(c : Character, side : bool) -> Node2D:
	if side:
		return c.right_sholder
	else:
		return c.left_sholder


static func err_massage(c : Character, sholder : Node2D, message : String) -> void:
	if not DEBUG() : return
	var b : String # begin text
	b = "add weapon to \"%s\" ID \"%s\" sholder \"%s\"" % [
		c.name,
		c.get_instance_id(),
		sholder.name
		]
	printerr(b, message)


static func add(c : Character, side : bool, weapon_name : String) -> bool:
	var sholder : Node2D = match_side(c, side)
	if not sholder.get_child_count() == 0:
		err_massage(c, sholder, " already has a weapon!")
		return false
	var weapon : Resource = WEAPON(weapon_name)
	if not weapon:
		err_massage(c, sholder, " weapon name \"%s\" dosnt exist!" % weapon_name)
		return false
	sholder.add_child(weapon.instance())
	return true


static func remove(c : Character, side : bool) -> void:
	var sholder : Node2D = match_side(c, side)
	for w in sholder.get_children():
		w.queue_free()
		sholder.remove_child(w)


static func change(c : Character, side : bool, weapon_name : String) -> bool:
	var sholder : Node2D = match_side(c, side)
	var weapon : Resource = WEAPON(weapon_name)
	if not weapon:
		err_massage(c, sholder, " weapon name \"%s\" dosnt exist!" % weapon_name)
		return false
	remove(c, side)
	sholder.add_child(weapon.instance())
	return true



static func do_have_weapon(c : Character, side : bool) -> bool:
	if match_side(c, side).get_child_count() == 0:
		return false
	else:
		return true


static func is_pressed(c : Character, side : bool) -> bool:
	for w in match_side(c, side).get_children():
		if w is Weapon:
			return w.is_pressed
	return false


static func pressed(c : Character, side : bool) -> void:
	for w in match_side(c, side).get_children():
		if w is Weapon:
			weapon_pressed(w)


static func released(c : Character, side : bool) -> void:
	for w in match_side(c, side).get_children():
		if w is Weapon:
			weapon_released(w)


static func weapon_pressed(w : Weapon) -> void:
	w.is_pressed = true
	if w.double_click_timer.is_stopped():
		w.anim.play(w.state+"Pressed")
		w.double_click_timer.start()
	else:
		weapon_switch_state(w)


static func weapon_switch_state(w : Weapon) -> void:
	if w.state == w.animList[0]:
		w.state = w.animList[1]
	else:
		w.state = w.animList[0]


static func weapon_released(w : Weapon) -> void:
	w.is_pressed = false
	w.anim.play(w.state+"Released")





