extends Area3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if "Player" in body.name:
		Dialogic.start("3dscene2_timeline")
		$"..".queue_free()
