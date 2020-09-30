extends System


class_name NodeCtl


static func add_worldscene(data : GameData , name : String) -> void:
	if data.world:
		if DEBUG():
			printerr("the world node is already exist!")
		return
	data.world = WORDL_SCENE(name).instance()
	data.get_parent().add_child(data.world)


static func remove_worldscene(data : GameData) -> void:
	data.world.queue_free()
	data.world.get_parent().remove_child(data.world)


static func add_player(data : GameData, position : Vector2) -> void:
	var player : Character = CHARACTER("player").instance()
	data.world.players.add_child(player)
	player.global_position = position
	player.dead_list = data.world.dead_list


static func remove_player(data : GameData, player : RigidBody2D) -> void:
	player.queue_free()
	data.player.erase(player)
	player.get_parent().remove_child(player)

