extends Node3D


func _ready():
	#$"../../../..".finished_generating.connect(spawn_traps)
	randomize()
	spawn_traps()

func spawn_traps():
	if RandomNumberGenerator.new().randf_range(0,GlobalVariables.trapWallSpawnRate) > 2.5: #trapWallSpawnRate
		$Rockeye_Trap.queue_free()
		$SusWall.queue_free()
	else:
		$Wall.queue_free()
		if RandomNumberGenerator.new().randf_range(0,GlobalVariables.trapEyeSpawnRate) > 2.5: #GlobalVariables.trapEyeSpawnRate
			$Rockeye_Trap.queue_free()
		else:
			$SusWall.queue_free()
