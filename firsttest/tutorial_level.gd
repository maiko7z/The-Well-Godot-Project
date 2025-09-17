extends Node3D

signal map_ready_to_generate

func _ready() -> void:
	randomize()
	
func player_reached_exit() -> void:
	get_tree().change_scene_to_file("res://screens/level_complete.tscn")
	print("yippee hip hip hurray!")
