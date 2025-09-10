extends Control

func _ready() -> void:
	%RetryButton.pressed.connect(_on_restart_pressed)
	%MainMenuButton.pressed.connect(_on_main_menu_pressed)
	%QuitButton.pressed.connect(_on_quit_pressed)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://screens//main_menu.tscn")
