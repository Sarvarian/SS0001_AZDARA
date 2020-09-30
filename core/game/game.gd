extends Node


class_name Game


func _ready() -> void:
	StartSys.ready($Data)
	pass


func _physics_process(delta : float) -> void:
	CharacterSys.process($Data.plrs(), $Data.npcs(), delta)
	pass


func _process(_delta : float) -> void:
	pass


func _input(_event : InputEvent) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
	pass
