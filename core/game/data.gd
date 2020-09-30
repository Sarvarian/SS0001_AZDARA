extends Node


class_name GameData


var world : WorldScene


func plrs() -> Array:
	if world:
		return world.players.get_children()
	else: return []
func npcs() -> Array:
	if world:
		return world.npcs.get_children()
	else: return []






