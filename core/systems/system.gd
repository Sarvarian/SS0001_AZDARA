extends Object


class_name System


enum MoveState {INDEPENDENT, LOOK_DEPENDENT}
enum LookState {FORWARD, DIRECTION, MOUSE, TARGET}


static func DEBUG() -> bool:
	return OS.has_feature("debug")


static func WORDL_SCENE(name : String) -> Resource:
	return load("res://scenes/" + name + ".tscn")

static func CHARACTER(name : String) -> Resource:
	return load("res://characters/" + name + ".tscn")

static func WEAPON(name : String) -> Resource:
	return load("res://weapons/" + name + ".tscn")
