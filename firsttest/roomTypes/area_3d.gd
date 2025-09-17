extends Area3D


func _on_area_3d_body_entered(body: Node3D) -> void:
	if "Player" in body.name:
		get_tree().change_scene_to_file.bind("res://screens//level_complete.tscn").call_deferred()
