extends Node2D
#@onready var viewport = get_tree().get_root().get_viewport()
@onready var dialogue_trigger_1: Area2D = $DialogueTrigger1

func _ready():
	Dialogic.start("scene1_timeline")
	#DisplayServer.window_set_size(Vector2i(1152, 648))
	#viewport.size = Vector2(1152,648)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		Dialogic.start("scene3_timeline")
		get_tree().change_scene_to_file("res://scenes2d/levels2d/level_1_transition.tscn")
	#DisplayServer.window_set_size(Vector2i(480, 320))
	#viewport.size = Vector2(480,320)

	


func _on_dialogue_trigger_1_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		Dialogic.start("scene2_timeline")
		dialogue_trigger_1.queue_free() 
