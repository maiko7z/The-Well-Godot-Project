extends EnemyState

@export var chase_max_time := 3.5
@export var update_path_delay := 0.0 # if you do not want to update the path every physics frame, increase this
@export var _chasing_speed := 5.0
@export var _catching_distance := 1.4

var _chase_timer := 0.0
var _update_path_timer := 0.0


func enter(previous_state_name: String, data := {}) -> void:
	_chase_timer = chase_max_time
	

func update(delta: float) -> void: #Crouching reduces chase time by 33%
	if _enemy.player.get_node("Head/Camera3D").v_offset < 0:
		_update_path_timer -= delta*1.33
		_chase_timer -= delta*1.33
	else:
		_update_path_timer -= delta
		_chase_timer -= delta

	if _chase_timer <= 0.0:
		requested_transition_to_other_state.emit("Searching", {"player_last_seen_position":_enemy.player.global_position})

func rockeye_triggered():
	_chase_timer = chase_max_time

func physics_update(_delta: float) -> void:
	var vec_to_player = (_enemy.player.global_position - _enemy.global_position)
	if _update_path_timer <= 0.0:
		_update_path_timer = update_path_delay
		_enemy.travel_to_position(_enemy.player.global_position, _chasing_speed, true)
	
	#terror radius
	$"../../TerrorRadiusChase".volume_db = 4.0 - vec_to_player.length()*1
	$"../../TerrorRadiusSearching".volume_db = -80.0
	$"../../TerrorRadiusNear".volume_db = -80.0
	
	if not _enemy.is_line_of_sight_broken():
		if vec_to_player.length() < 20.0: #if the player is under the max sight distance
			if _enemy.player.get_node("Head/SpotLight3D").visible: #if their light is on, they can be seen!
				#print("I see your light!")
				_chase_timer = chase_max_time
			if vec_to_player.length() < 6.5 and not _enemy.player.get_node("Head/SpotLight3D").visible and _enemy.player.get_node("Head/Camera3D").v_offset == 0: #if their light is off but they are very close...
				#print("I'm close enough to see you!'")
				_chase_timer = chase_max_time
			elif vec_to_player.length() < 3.75 and not _enemy.player.get_node("Head/SpotLight3D").visible and _enemy.player.get_node("Head/Camera3D").v_offset < 0:
				_chase_timer = chase_max_time
	
	if _enemy.global_position.distance_to(_enemy.player.global_position) <= _catching_distance:
		_enemy.reached_player.emit()
