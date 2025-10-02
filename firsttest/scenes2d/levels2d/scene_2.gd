extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		Dialogic.start("scene6_timeline")
		get_tree().change_scene_to_file("res://world.tscn")
	
	
func _ready():
	Dialogic.start("scene5_timeline")
	
@onready var player = $Player
@onready var well  =$"Grayish Well_SCENE 2"
@onready var theme  = $Theme

func _physics_process(delta):
	var distance_from_well = player.global_position.distance_to(well.global_position)
	theme.pitch_scale = 1/(1/(distance_from_well/75))
