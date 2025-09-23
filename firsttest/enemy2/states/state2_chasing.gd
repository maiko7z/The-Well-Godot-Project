extends CorpseEnemyState


@export var chase_max_time : int = 1.0
@export var update_path_delay := 0.0 # if you do not want to update the path every physics frame, increase this
@export var _chasing_speed : int = 0.0
@export var _catching_distance := 10.0
@export var _slaughter_distance := 2.0

@onready var vision_detection = $"../../VisibleOnScreenEnabler3D"
@onready var vision_node = $"../../VisibleCheck"

var _chase_timer := 0.0
var _update_path_timer := 0.0
#@onready var chaseRoar = $"../../Sounds/ChaseSound"
#@onready var chaseRoar2 = $"../../Sounds/ChaseSound2"
#@onready var aggroSound = $"../../Sounds/AggroSound"

func enter(previous_state_name: String, data := {}) -> void:
	#if not chaseRoar.playing:
		#aggroSound.stop()
		#chaseRoar.play()
		#chaseRoar2.play()
	#print("Chasing!")
	_chase_timer = chase_max_time
	

func update(delta: float) -> void: #Crouching reduces chase time by 33%
	if _enemy2.player.get_node("Head/Camera3D").v_offset < 0:
		_update_path_timer -= delta*1.33
		_chase_timer -= delta*1.33
	else:
		_update_path_timer -= delta
		_chase_timer -= delta

	if _chase_timer <= 0.0:
		requested_transition_to_other_state.emit("Searching", {"player_last_seen_position":_enemy2.player.global_position})

func physics_update(_delta: float) -> void:
	var vec_to_player = (_enemy2.player.global_position - _enemy2.global_position)
	if _update_path_timer <= 0.0:
		_update_path_timer = update_path_delay
		_enemy2.travel_to_position(_enemy2.player.global_position, _chasing_speed, true)
	
	#terror radius
	if not _enemy2.is_line_of_sight_broken():
		if vec_to_player.length() < 15.0: #if the player is under the max sight distance
			if _enemy2.player.get_node("Head/SpotLight3D").visible: #if their light is on, they can be seen!
				#print("I see your light!")
				_chase_timer = chase_max_time
			if vec_to_player.length() < 5.0 and not _enemy2.player.get_node("Head/SpotLight3D").visible and _enemy2.player.get_node("Head/Camera3D").v_offset == 0: #if their light is off but they are very close...
				#print("I'm close enough to see you!'")
				_chase_timer = chase_max_time
			elif vec_to_player.length() < 3.75 and not _enemy2.player.get_node("Head/SpotLight3D").visible and _enemy2.player.get_node("Head/Camera3D").v_offset < 0:
				_chase_timer = chase_max_time

	
	if _enemy2.global_position.distance_to(_enemy2.player.global_position) <= _catching_distance and _enemy2.player.get_node("Head/SpotLight3D").visible and not vision_node.process_mode == Node.PROCESS_MODE_DISABLED:
		$"../../OmniLight3D".visible = true #I could easily condense the repeat code into a function but it's 2am and I am so tired and lazy rn
		await get_tree().create_timer(0.5).timeout
		_enemy2.reached_player.emit()
		$"../../OmniLight3D".visible = false
	elif _enemy2.global_position.distance_to(_enemy2.player.global_position) <= _slaughter_distance and not _enemy2.player.get_node("Head/SpotLight3D").visible:
		$"../../OmniLight3D".visible = true
		await get_tree().create_timer(0.5).timeout
		_enemy2.reached_player.emit()
		$"../../OmniLight3D".visible = false
	elif _enemy2.global_position.distance_to(_enemy2.player.global_position) <= _slaughter_distance + 1.0 and not _enemy2.player.get_node("Head/SpotLight3D").visible and not vision_node.process_mode == Node.PROCESS_MODE_DISABLED:
		$"../../OmniLight3D".visible = true
		await get_tree().create_timer(0.5).timeout
		_enemy2.reached_player.emit()
		$"../../OmniLight3D".visible = false
