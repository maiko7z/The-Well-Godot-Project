extends EnemyState

@export var _roaming_speed : int = GlobalVariables.wraithModRoamSpeed

var _map_synchronized := false
var _target_position: Vector3
var _nav_map: RID

@onready var aggroSound = $"../../Sounds/AggroSound"
@onready var deaggroSound = $"../../Sounds/DeaggroSound"
@onready var idleSound = $"../../Sounds/IdleSound"

func _ready() -> void:
	#await get_tree().create_timer(7).timeout
	await get_tree().physics_frame
	await get_tree().physics_frame
	_map_synchronized = true
	_nav_map = _enemy.get_world_3d().get_navigation_map()


func enter(previous_state_name: String, data := {}) -> void:
	
	if not aggroSound.playing and previous_state_name == "Searching":
		deaggroSound.play()
		aggroSound.stop()
	
	if not _map_synchronized:
		return
	
	if data.has("do_not_reset_path") and data["do_not_reset_path"]:
		_enemy.travel_to_position(_enemy.navigation_agent.target_position, _roaming_speed)
		return
	
	
	_travel_to_random_position()

func rockeye_triggered():
	requested_transition_to_other_state.emit("Chasing")

func physics_update(_delta: float) -> void:
	if not _map_synchronized:
		return
	
	#terror radius
	if not idleSound.playing and RandomNumberGenerator.new().randf_range(0,10) > 9.5:
		idleSound.play()
	
	var vec_to_player = (_enemy.player.global_position - _enemy.global_position)
	if vec_to_player.length() < 30.0:
		$"../../TerrorRadiusNear".volume_db = 3.0 - vec_to_player.length()*1.25
	else:
		$"../../TerrorRadiusNear".volume_db = -80.0
	
	$"../../TerrorRadiusChase".volume_db = -80.0
	$"../../TerrorRadiusSearching".volume_db = -80.0
	if _enemy.navigation_agent.is_navigation_finished():
		_travel_to_random_position()
	
	if _enemy.is_player_in_view():
		requested_transition_to_other_state.emit("Chasing")
	if _enemy.is_player_conspicuous():
		requested_transition_to_other_state.emit("Searching", {"player_last_seen_position":_enemy.player.global_position})


func _travel_to_random_position() -> void:
	var rand_pos := NavigationServer3D.map_get_random_point(_nav_map, 1, true)
	_enemy.travel_to_position(rand_pos, _roaming_speed)
