extends Control
@onready var scareTimer = $ScareTime

func _ready():
	scareTimer.start()
	for i in 25:
		var screen_size = get_viewport_rect().size
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var random_x = rng.randi_range(200, 230)
		var random_y = rng.randi_range(190, 220)
		$JumpscarePlaceholder.position = Vector2(random_x, random_y)
		await get_tree().create_timer(0.05).timeout

func _scene_swap():
	get_tree().change_scene_to_file("res://screens//game_over.tscn")
