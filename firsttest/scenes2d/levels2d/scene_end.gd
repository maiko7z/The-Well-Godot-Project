extends Node2D
#@onready var viewport = get_tree().get_root().get_viewport()
@onready var dialogue_trigger_1: Area2D = $DialogueTrigger1

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("scene12_timeline")
	#DisplayServer.window_set_size(Vector2i(1152, 648))
	#viewport.size = Vector2(1152,648)
	
func _on_dialogic_signal(argument:String):
	if argument == "StoryEnd":
		get_tree().change_scene_to_file("res://screens/story_mode_ending.tscn")
	

func _on_dialogue_trigger_1_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		Dialogic.start("scene13_timeline")
		dialogue_trigger_1.queue_free() 
