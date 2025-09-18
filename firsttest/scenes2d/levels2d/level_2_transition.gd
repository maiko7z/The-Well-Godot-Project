extends Control
@onready var scareTimer = $ScareTime

func _ready():
	scareTimer.start()
	for i in 25:
		var screen_size = get_viewport_rect().size
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var random_x = rng.randi_range(0, 705)
		var random_y = rng.randi_range(0, 500)
		var random_x2 = rng.randi_range(0, 705)
		var random_y2 = rng.randi_range(0, 500)
		$JumpscarePlaceholder.position = Vector2(random_x, random_y)
		$Accuse.position = Vector2(random_x2, random_y2)
		await get_tree().create_timer(0.05).timeout

func _scene_swap():
	get_tree().change_scene_to_file("res://world.tscn")
