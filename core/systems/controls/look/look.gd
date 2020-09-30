extends System


class_name LookCtl


static func process(character : Character , delta : float) -> void:
	var rotang : float = LookCtlAnalyser.rotang(character)
	
	character.apply_torque_impulse(rotang * character.rotate_speed * delta)
#	character.rotate(lerp_angle(0, rotang, character.rotate_weight)) # rotate_weight = .1

