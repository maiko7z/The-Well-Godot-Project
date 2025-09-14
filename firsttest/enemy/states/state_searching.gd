extends EnemyState

@export var search_time := 10.0
@export var _searching_speed := 5.0
@export var _search_radius := 10.0

var _search_timer := 0.0
var _player_last_seen_position: Vector3

@onready var aggroSound = $"../../Sounds/AggroSound"
@onready var deaggroSound = $"../../Sounds/DeaggroSound"

func enter(previous_state_name: String, data := {}) -> void:
	#RandomNumberGenerator.new().randf_range(0,10) > 2.5
	if not aggroSound.playing and previous_state_name == "Roaming":
		aggroSound.play()
		deaggroSound.stop()
	
	if data["player_last_seen_position"]:
		_player_last_seen_position = data["player_last_seen_position"]
	else:
		printerr("State 'Searching' was not given the player's last seen position through the data dictionary.")
		
	_search_timer = search_time
	#var tween = get_tree().create_tween()
	#tween.tween_property($"../../TerrorRadiusChase", "volume_db", -80, 2).set_trans(Tween.TRANS_SINE)
	_go_to_position_around_player_last_seen_position()


func update(delta: float) -> void:
	_search_timer -= delta
	if _search_timer <= 0.0:
		requested_transition_to_other_state.emit("Roaming", {"do_not_reset_path": true})

func rockeye_triggered():
	requested_transition_to_other_state.emit("Chasing")

func physics_update(_delta: float) -> void:
	var vec_to_player = (_enemy.player.global_position - _enemy.global_position)
	if _enemy.navigation_agent.is_navigation_finished():
		_go_to_position_around_player_last_seen_position()
		
	$"../../TerrorRadiusSearching".volume_db = 1.0 - vec_to_player.length()*1.25
	$"../../TerrorRadiusNear".volume_db = -80.0
	$"../../TerrorRadiusChase".volume_db = -80.0
	
	if not _enemy.is_line_of_sight_broken():
		if vec_to_player.length() < 20.0:
			if _enemy.player.get_node("Head/SpotLight3D").visible:
				#print("I see your light!")
				requested_transition_to_other_state.emit("Chasing")
			if vec_to_player.length() < 6.5 and not _enemy.player.get_node("Head/SpotLight3D").visible and _enemy.player.get_node("Head/Camera3D").v_offset == 0:
				#print("I'm close enough to see you!'")
				requested_transition_to_other_state.emit("Chasing")
			elif vec_to_player.length() < 3.75 and not _enemy.player.get_node("Head/SpotLight3D").visible and _enemy.player.get_node("Head/Camera3D").v_offset < 0:
				requested_transition_to_other_state.emit("Chasing")
			if _enemy.is_player_conspicuous():
				#print("I hear you!")
				requested_transition_to_other_state.emit("Chasing")


func _go_to_position_around_player_last_seen_position() -> void:
	var random_position := _player_last_seen_position + _get_random_position_inside_circle(_search_radius, _player_last_seen_position.y)
	_enemy.travel_to_position(random_position, _searching_speed, true)


func _get_random_position_inside_circle(radius: float, height: float) -> Vector3:
	var theta: float = randf() * 2 * PI
	return Vector3(cos(theta), height, sin(theta)) * sqrt(randf()) * radius
