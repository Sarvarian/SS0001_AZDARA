extends System


class_name StartSys


static func ready(data : GameData) -> void:
	NodeCtl.add_worldscene(data, "test")
	data.world.camera.current = true
	start_with_player(data)
	pass


static func start_with_player(data : GameData) -> void:
	NodeCtl.add_player(data, data.world.spawn.global_position)
	data.plrs()[0].camera.current = true
	for c in data.plrs() + data.npcs():
		if c is Character:
# warning-ignore:return_value_discarded
			WeaponCtl.add(c, WeaponCtl.RIGHT, "dagger")
# warning-ignore:return_value_discarded
			WeaponCtl.add(c, WeaponCtl.LEFT, "dagger")
	pass
