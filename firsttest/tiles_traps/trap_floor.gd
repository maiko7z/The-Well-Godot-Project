extends Area3D

var canHurt = true

func _on_area_3d_body_entered(body: Node3D) -> void:
	if "Player" in body.name and canHurt == true:
		canHurt = false
		#print("hurting player!") this is for debug purposes
		$"../ActivateSound".play()
		$"../sus-active".visible = true
		$"../sus-closed".visible = false
		body._take_damage(25)
		$".".disconnect("body_entered",_on_area_3d_body_entered)
