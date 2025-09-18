extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes2d/levels2d/level_2_transition.tscn")
	
