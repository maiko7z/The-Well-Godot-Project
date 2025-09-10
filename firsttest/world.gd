extends Node3D

signal map_ready_to_generate

func _ready() -> void:
	map_ready_to_generate.emit()
	await get_tree().create_timer(3.0).timeout
	var enemy: Enemy = get_tree().get_first_node_in_group("enemy")
	if enemy:
		enemy.reached_player.connect(_enemy_reached_player)
	else:
		print("no enemy, no connection generated.")

func _enemy_reached_player() -> void:
	get_tree().change_scene_to_file("res://screens/game_over.tscn")
	print("owie ouch ow")
	
func player_reached_exit() -> void:
	get_tree().change_scene_to_file("res://screens/level_complete.tscn")
	print("yippee hip hip hurray!")
