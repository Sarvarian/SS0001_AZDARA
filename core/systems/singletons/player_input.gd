extends Node


var actions : PoolStringArray = [
	# Move
	"move_up",
	"move_left",
	"move_down",
	"move_right",
	# Look
	"look_up",
	"look_left",
	"look_down",
	"look_right",
	# Actions
	"action_left",
	"action_right",
	# Etc.
	"dash",
	"slow_walk",
	"switch_state",
	"pick_up",
	# Camera
	"camera_zoom_in",
	"camera_zoom_out",
]


func move_up_2(player : Character, strength : float) -> void:
	player.move_dir += Vector2.UP * strength

func move_left_2(player : Character, strength : float) -> void:
	player.move_dir += Vector2.LEFT * strength

func move_down_2(player : Character, strength : float) -> void:
	player.move_dir += Vector2.DOWN * strength

func move_right_2(player : Character, strength : float) -> void:
	player.move_dir += Vector2.RIGHT * strength



func look_up_2(player : Character, strength : float) -> void:
	player.look_dir += Vector2.UP * strength

func look_left_2(player : Character, strength : float) -> void:
	player.look_dir += Vector2.LEFT * strength

func look_down_2(player : Character, strength : float) -> void:
	player.look_dir += Vector2.DOWN * strength

func look_right_2(player : Character, strength : float) -> void:
	player.look_dir += Vector2.RIGHT * strength


func action_left_1(player : Character, _strength : float) -> void:
	WeaponCtl.pressed(player, WeaponCtl.LEFT)

func action_left_0(player : Character, _strength : float) -> void:
	WeaponCtl.released(player, WeaponCtl.LEFT)

func action_right_1(player : Character, _strength : float) -> void:
	WeaponCtl.pressed(player, WeaponCtl.RIGHT)

func action_right_0(player : Character, _strength : float) -> void:
	WeaponCtl.released(player, WeaponCtl.RIGHT)


func dash_1(player : Character, _strength : float) -> void:
	CharacterCtl.dash(player)




