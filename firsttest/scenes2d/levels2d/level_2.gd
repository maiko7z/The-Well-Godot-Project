extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	Dialogic.start("scene4extra_timeline")
	get_tree().change_scene_to_file("res://scenes2d/levels2d/level_2_transition.tscn")
	
func _ready():
	Dialogic.start("scene4_timeline")
	#DisplayServer.window_set_size(Vector2i(1152, 648))
	#viewport.size = Vector2(1152,648)
