extends InNodeSystem


class_name InWeaponSystem


onready var w : Weapon = get_parent()


func ready() -> void:
	find_rigid_parent()
	WeaponCtl.weapon_released(w)


func find_rigid_parent() -> void:
	var p : Node = w
	while p:
		p = p.get_parent()
		if p is RigidBody2D:
			w.parent = p
			return



## For DEBUG perpose
#func _process(delta : float) -> void:
#	var plv : Vector2 = w.parent.linear_velocity / 100
#	var pav : float = w.parent.angular_velocity
#	print(int(Vector2(abs(plv.x), abs(plv.y)).length()), " / ", int(abs(pav)))


func _on_Hand_body_entered(body : PhysicsBody2D) -> void:
	if body:
		if body is Character:
			var ec : float = encounter(body)
			var dir : Vector2 = (body.global_position - w.hand.global_position).normalized()
			var knockback : Vector2 = dir * w.knockback_power
			w.p_last_char_entered = body
			CharacterCtl.damage(body, int(w.damage_power*ec), knockback*ec)

		if body.is_in_group("Weapons"):
			WeaponCtl.weapon_released(w)


func encounter(enemy : PhysicsBody2D) -> float:
	if not w.parent: return .0

	var clv : Vector2 = w.parent.linear_velocity / 100
	var cav : float = w.parent.angular_velocity

	if enemy is RigidBody2D:
		var elv : Vector2 = enemy.linear_velocity /100
		var eav : float =  enemy.angular_velocity
		return Vector2(
			abs(clv.x - elv.x),
			abs(clv.y - elv.y)
			).length() + abs(cav - eav)

	return Vector2(
		abs(clv.x),
		abs(clv.y)
		).length() + abs(cav)
