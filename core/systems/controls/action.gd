extends System


class_name ActionCtl


static func process(player : Character, index : int) -> void:
	for a in PlayerInput.actions:
		var act : String = "player" + str(index) + "_" + a
		if InputMap.has_action(act):
			if Input.is_action_just_pressed(act):
				plr_mtd_call(player, a, 1, Input.get_action_strength(act))
			elif Input.is_action_pressed(act):
				plr_mtd_call(player, a, 2, Input.get_action_strength(act))
			elif Input.is_action_just_released(act):
				plr_mtd_call(player, a, 0, Input.get_action_strength(act))


static func plr_mtd_call(player : Character, name : String, state : int, strength : float) -> void:
	name = name + "_" + str(state)
	if PlayerInput.has_method(name):
		PlayerInput.call(name, player, strength)
