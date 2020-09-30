extends Node2D


class_name Weapon


export var damage_power : int = 4
export var knockback_power : float = 100

var parent : RigidBody2D
var animList : PoolStringArray = ["FirstState", "SecondState"]
var state : String = animList[0]
var is_pressed : bool = false
var p_last_char_entered : PhysicsBody2D = null

onready var double_click_timer : Timer = $DoubleClickTimer
onready var anim : AnimationPlayer = $AnimationPlayer
onready var hand : Area2D = $Elbow/Hand


func _ready():
	$System.ready()



