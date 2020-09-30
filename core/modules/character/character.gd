extends RigidBody2D


class_name Character


# hp was 200
# speed was 4000
# rotate_speed was 100000
# _mp is Multipliers

# Exports
export(int) var hp : int = 2 setget ,get_hp
func get_hp() -> int: return hp * hp_mp
const hp_mp := 100

export(int) var speed : int = 40 setget ,get_speed
func get_speed() -> int: return speed * speed_mp
const speed_mp := 100

export(float) var rotate_speed : float = 10 setget ,get_rotate_speed
func get_rotate_speed() -> float: return rotate_speed * rotate_speed_mp
const rotate_speed_mp := 10000

export(System.MoveState) var move_state : int = System.MoveState.INDEPENDENT
export(System.LookState) var look_state : int = System.LookState.MOUSE
export(int, 50, 500) var motion_test_length : int = 250
export(int, 2, 90) var motion_test_degrees : int = 30

# Variables
var speed_filter : float = 1
var move_persist_dir : Vector2 = Vector2.ZERO
var move_dir : Vector2 = Vector2.ZERO
var look_persist_dir : Vector2 = Vector2.ZERO
var look_dir : Vector2 = Vector2.ZERO
var look_target : Node2D = null

# Death Variables
var dead_list : Node2D = null
var is_dead : bool = false

# Onreadies
onready var left_sholder : Node2D = $LeftSholder
onready var right_sholder : Node2D = $RightSholder
onready var sprite : Sprite = $Sprite
onready var camera : Camera2D = $Camera
onready var collision : CollisionShape2D = $Collision
onready var raycast : RayCast2D = $RayCast
onready var ai_systems : Node = $AISystems
onready var dash_timer : Timer = $DashTimer
onready var state_timer : Timer = $StateTimer
onready var animation_player : AnimationPlayer = $AnimationPlayer
onready var index : int = get_index()

######## Momory ########
var p_bodies_on_sight_area : Array = []
var p_bodies_on_sight : Array = []
var p_closest_body_on_sight : PhysicsBody2D = null
var p_target_on_sight : PhysicsBody2D = null
var o_last_target_on_sight_position : Node2D = null # Preferably use global_position


######## Main ########
func _ready() -> void:
	$System.ready()


func _physics_process(_delta : float) -> void:
	$System.physics_process()




