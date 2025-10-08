extends Control
@onready var message = $CenterContainer/VBoxContainer/LoreLabel
var tween = create_tween()

func _ready() -> void:
	randomize()
	%MainMenuButton.pressed.connect(_on_main_menu_pressed)
	%QuitButton.pressed.connect(_on_quit_pressed)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var textChoice = RandomNumberGenerator.new().randf_range(0,10)
	message.text = "I'll never forget you."
		
	tween.tween_property($Background, "color", Color(0,0,0,1), 1.0)
	GlobalVariables.storyLevel = 4
	GlobalVariables.storyCompleted = true

func _on_quit_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().quit()
	
func _on_main_menu_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens//main_menu.tscn")
