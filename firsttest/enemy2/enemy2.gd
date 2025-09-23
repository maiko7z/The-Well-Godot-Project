extends CharacterBody3D
class_name CorpseEnemy

signal reached_player

@export var max_spotting_distance := 15.0
@export var max_hearing_distance := 10.0

var _current_speed := 0.0
@onready var navigation_agent: NavigationAgent3D = %NavigationAgent3D
#@onready var animation_player: AnimationPlayer = %EnemyModel/AnimationPlayer
@onready var player = get_tree().get_first_node_in_group("player")
@onready var _eye: Node3D = %Eye
@onready var _eye_ray_cast: RayCast3D = %EyeRayCast
@onready var footstepSound: AudioStreamPlayer3D = $StepSoundPlayer
var prevStep := Vector3.ZERO


func _ready() -> void:
	#await get_tree().create_timer(3).timeout
	set_physics_process(false)
	await get_tree().physics_frame
	set_physics_process(true)
	print(player.get_path())





#func findAndSetPlayerVar():
	#player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta: float) -> void:
	if navigation_agent.is_navigation_finished():
		#animation_player.play("Idle", 0.2)
		return
	
	var next_path_position := navigation_agent.get_next_path_position()
	
	var xz_position := Vector3(global_position.x, 0.0, global_position.z)
	if prevStep.distance_to(xz_position) > 1.5:
		prevStep = xz_position
		footstepSound.play()
	
	var where_to_look := next_path_position
	where_to_look.y = global_position.y
	if not where_to_look.is_equal_approx(global_position):
		# if you want interpolation, look into quaternions and slerp()
		# I'm just using look_at for simplicity
		look_at(where_to_look)
	
	var direction := next_path_position - global_position
	direction.y = 0.0
	direction = direction.normalized()
	velocity = direction * _current_speed
	move_and_slide()


func travel_to_position(wanted_position: Vector3, speed: float, play_run_anim := false) -> void:
	navigation_agent.target_position = wanted_position
	_current_speed = speed
	
	#if play_run_anim:
	#	animation_player.play("Run", 0.2)
	#else:
	#	animation_player.play("Walk", 0.2)


func is_player_in_view() -> bool:
	var vec_to_player = (player.global_position - global_position)
	
	if vec_to_player.length() > max_spotting_distance:
		return false
	
	if vec_to_player.length() > 6.5 and not player.get_node("Head/SpotLight3D").visible and player.get_node("Head/Camera3D").v_offset == 0 :
		return false
	elif vec_to_player.length() > 3.75 and not player.get_node("Head/SpotLight3D").visible and player.get_node("Head/Camera3D").v_offset < 0:
		return false
		
	var in_fov := -_eye.global_basis.z.normalized().dot(vec_to_player.normalized()) > 0.3
	
	if in_fov:
		return not is_line_of_sight_broken()
	
	return false
func is_player_conspicuous() -> bool:
	var vec_to_player = (player.global_position - global_position)
	
	if vec_to_player.length() < 6.0 and player.get_node("Head/StepSound").playing:
		return true
	if vec_to_player.length() < 10.0 and player.get_node("Head/SpotLight3D").visible:
		return not is_line_of_sight_broken()
		
	return false
func is_line_of_sight_broken() -> bool:
	_eye_ray_cast.target_position = _eye_ray_cast.to_local(player.global_position)
	_eye_ray_cast.force_raycast_update()
	return _eye_ray_cast.is_colliding()
