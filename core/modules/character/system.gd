extends InNodeSystem


class_name InCharacterSystem


onready var c : Character = get_parent()


######## Main ########
func ready() -> void:
	find_dead_list()


func physics_process() -> void:
	find_bodies_on_sight()
	find_closest_body_on_sight()
	set_target_on_sight_null_if_is_out_of_sight()
	set_last_target_position()


func find_dead_list() -> void:
	var p : Node = c
	while p:
		p = p.get_parent()
		for n in p.get_children():
			if n.name == "DeadList":
				c.dead_list = n
				return


func _on_AITimer_timeout():
	for sys in c.ai_systems.get_children():
		if sys.process(c):
			return


func call_after_death() -> void:
	c.set_mode(RigidBody2D.MODE_STATIC)
	c.collision.set_disabled(true)
	if c.dead_list:
		var sprite_trans : Transform2D = c.sprite.global_transform
		var cam_trans : Transform2D = c.camera.get_global_transform()
		c.remove_child(c.sprite)
		c.remove_child(c.camera)
		c.dead_list.add_child(c.sprite)
		c.dead_list.add_child(c.camera)
		c.sprite.set_global_transform(sprite_trans)
		c.sprite.set_modulate(c.get_modulate())
		c.camera.set_global_transform(cam_trans)
		c.get_parent().remove_child(c)
		c.queue_free()
	pass



######## Perceptions ########
func _on_Sight_body_entered(body : Character) -> void:
	if body == c: return
	if not c.p_bodies_on_sight_area.has(body):
		c.p_bodies_on_sight_area.append(body)


func _on_Sight_body_exited(body : Character) -> void:
	if c.p_bodies_on_sight_area.has(body):
		c.p_bodies_on_sight_area.erase(body)


func find_bodies_on_sight() -> void:
	c.p_bodies_on_sight.clear()
	for b in c.p_bodies_on_sight_area:
		c.raycast.set_global_rotation(0)
		c.raycast.set_cast_to(b.global_position - c.global_position)
		c.raycast.force_raycast_update()
		if c.raycast.get_collider() == b:
			c.p_bodies_on_sight.append(b)


func find_closest_body_on_sight() -> void:
	c.p_closest_body_on_sight = null
	for b in c.p_bodies_on_sight:
		if not c.p_closest_body_on_sight:
			c.p_closest_body_on_sight = b
		else:
			if c.global_position.distance_squared_to(b.global_position) < c.global_position.distance_squared_to(c.p_closest_body_on_sight.global_position):
				c.p_closest_body_on_sight = b


func set_target_on_sight_null_if_is_out_of_sight() -> void:
	if not c.p_bodies_on_sight.has(c.p_target_on_sight):
		c.p_target_on_sight = null


func set_last_target_position() -> void:
	if c.p_target_on_sight:
		if not c.o_last_target_on_sight_position:
			c.o_last_target_on_sight_position = Node2D.new()
			Temp.add_child(c.o_last_target_on_sight_position)
		c.o_last_target_on_sight_position.position = c.p_target_on_sight.position
		c.o_last_target_on_sight_position.global_position = c.p_target_on_sight.global_position
