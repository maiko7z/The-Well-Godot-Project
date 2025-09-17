extends Node3D

func _ready():
	randomize()
	spawn_traps()

func spawn_traps():
	if RandomNumberGenerator.new().randf_range(0,GlobalVariables.trapSusSpawnRate) > 1.5: #GlobalVariables.trapSusSpawnRate
		$SusFloor.queue_free()
	else:
		$Floor.queue_free()
