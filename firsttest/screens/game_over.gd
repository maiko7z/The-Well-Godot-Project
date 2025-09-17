extends Control
@onready var message = $CenterContainer/VBoxContainer/LoreLabel

func _ready() -> void:
	randomize()
	%RetryButton.pressed.connect(_on_restart_pressed)
	%MainMenuButton.pressed.connect(_on_main_menu_pressed)
	%QuitButton.pressed.connect(_on_quit_pressed)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if GlobalVariables.currentGameMode == "Story":
		%RetryButton.text = "Retry? ( Level " + str(GlobalVariables.storyLevel) + " )"
	else:
		%RetryButton.text = "Retry? ( Level " + str(GlobalVariables.endlessLevel) + " )"
	var textChoice = RandomNumberGenerator.new().randf_range(0,10)
	if textChoice < 2.5: 
		message.text = "Your mind blanks, full of pain... \n...but hungry for answers."
	elif textChoice >= 2.5 and textChoice < 5:
		message.text = "Lost in thought again... \n...why can't you remember?"
	elif textChoice >= 5 and textChoice < 7.5:
		message.text = "The answer, again, just out of reach."
	elif textChoice >= 7.5:
		message.text = "Why do you hide the truth from yourself?"
	
func _on_restart_pressed() -> void:
	GlobalSounds.click_sound_play()
	if GlobalVariables.currentGameMode == "Story" and GlobalVariables.storyLevel == 0:
		get_tree().change_scene_to_file("res://tutorial_level.tscn")
	else:
		get_tree().change_scene_to_file("res://world.tscn")
	
func _on_quit_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().quit()
	
func _on_main_menu_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens//main_menu.tscn")
