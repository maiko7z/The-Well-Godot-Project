extends StaticBody2D
@onready var dialogue_trigger_1: Area2D = $DialogueTrigger1

#func _on_area_2d_body_entered(body: Node2D) -> void:
	#if "Player" in body.name:
		#Dialogic.start("scene10_timeline")
		#get_tree().change_scene_to_file("res://world.tscn")
	
func _on_dialogic_signal(argument:String):
	if argument == "DoneDialogue":
		Dialogic.start("scene11_timeline")
		get_tree().change_scene_to_file("res://world.tscn")

	
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	GlobalVariables.storyPlayerMovementSpeed = 20.0
	Dialogic.start("scene9_timeline")
	
@onready var player = $Player
@onready var well  = $"Scene 4_well"

func _physics_process(delta):
	var distance_from_well = player.global_position.distance_to(well.global_position)
	$Fear2.volume_db = -35 + (distance_from_well/10)
	$Fear3.volume_db = -35 + (distance_from_well/10)
	
func _on_dialogue_trigger_1_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		Dialogic.start("scene10_timeline")
		dialogue_trigger_1.queue_free() 
