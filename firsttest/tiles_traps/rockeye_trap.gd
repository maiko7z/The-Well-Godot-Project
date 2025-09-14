extends Area3D

var canHurt = true
@onready var cooldown = $"../Cooldown"

#func _ready() -> void:
	

func _on_area_3d_body_entered(body: Node3D) -> void:
	_activate_eye(body)

func _on_area_3d_body_left(body: Node3D) -> void:
	_activate_eye(body)

func _activate_eye(body: Node3D):
	if "Player" in body.name and canHurt == true and body.get_node("Head/Camera3D").v_offset == 0:
		canHurt = false
		#print("hurting player!") this is for debug purposes
		$"../OpenSound".play()
		$"../ScareSound".play()
		$"../RoarSound".play()
		$"../eye-opened".visible = true
		$"../eye-closed".visible = false
		cooldown.start()
		var enemy: Enemy = get_tree().get_first_node_in_group("enemy")
		if enemy:
			enemy.get_node("StateMachine/Roaming").rockeye_triggered()
		else:
			print("no enemy, nothing to alert.")
		$".".disconnect("body_entered",_on_area_3d_body_entered)
		$".".disconnect("body_exited",_on_area_3d_body_left)
		body._take_damage(5)

func _ready_to_reopen():
	$"../CloseSound".play()
	$"../eye-opened".visible = false
	$"../eye-closed".visible = true
	canHurt = true
	$".".connect("body_entered",_on_area_3d_body_entered)
	$".".connect("body_exited",_on_area_3d_body_left)
