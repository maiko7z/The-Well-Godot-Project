extends StaticBody2D
@onready var dialogue_trigger_1: Area2D = $DialogueTrigger1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		Dialogic.start("scene8_timeline")
		get_tree().change_scene_to_file("res://world.tscn")
	
	
func _ready():
	GlobalVariables.storyPlayerMovementSpeed = 20.0
	Dialogic.start("scene7_timeline")
	
@onready var player = $Player
@onready var well  = $"Scene 3_Well"

func _physics_process(delta):
	var distance_from_well = player.global_position.distance_to(well.global_position)
	$CanvasLayer/Darkness.color = Color(0,0,0,(1/((distance_from_well/50))+0.125))
	$Theme.volume_db = 1 - (distance_from_well/10)
	
func _on_dialogue_trigger_1_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		Dialogic.start("item2_teddybear")
		dialogue_trigger_1.queue_free() 
