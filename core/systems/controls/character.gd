extends System


class_name CharacterCtl


static func dash(c : Character) -> void:
	c.apply_central_impulse(c.linear_velocity * 5)


static func damage(c : Character, dp : int, kb : Vector2) -> void:
	if not c.is_dead:
		c.animation_player.stop()
		c.animation_player.play_backwards("Damage")
		c.hp -= dp # damage_power
		c.apply_central_impulse(kb) # knockback
		if c.hp < 0:
			death(c)


static func death(c : Character) -> void:
	c.remove_child(c.left_sholder)
	c.left_sholder.queue_free()
	c.remove_child(c.right_sholder)
	c.right_sholder.queue_free()
	c.animation_player.play("Death")
	c.set_z_as_relative(-1)
	c.is_dead = true
