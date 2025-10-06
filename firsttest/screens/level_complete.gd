extends Control
@onready var message = $CenterContainer/VBoxContainer/LoreLabel
var tween = create_tween()

func _ready() -> void:
	randomize()
	%ContinueButton.pressed.connect(_on_restart_pressed)
	%MainMenuButton.pressed.connect(_on_main_menu_pressed)
	%QuitButton.pressed.connect(_on_quit_pressed)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var textChoice = RandomNumberGenerator.new().randf_range(0,10)
	if textChoice < 2.5: 
		message.text = "No more lies to yourself. \nThe truth must be yours."
	elif textChoice >= 2.5 and textChoice < 5:
		message.text = "Suddenly, it becomes clearer... \n...clarity at last?"
	elif textChoice >= 5 and textChoice < 7.5:
		message.text = "You feel closer to the truth."
	elif textChoice >= 7.5:
		message.text = "Revelation at last? No... but nearly!"
		
	tween.tween_property($Background, "color", Color(0,0,0,1), 1.0)
	
	if GlobalVariables.currentGameMode == "Story":
		GlobalVariables.storyLevel += 1
		%ContinueButton.text = "Continue ( Level " + str(GlobalVariables.storyLevel) + " )"
	else:
		GlobalVariables.endlessLevel += 1
		if (GlobalVariables.endlessLevel % 5 == 0) and GlobalVariables.endlessCurrentLives < 5:
			GlobalVariables.endlessCurrentLives += 1
		
		%ContinueButton.text = "Continue ( Level " + str(GlobalVariables.endlessLevel) + " )"
		if GlobalVariables.endlessCurrentLives == 1:
			message.text = message.text + "\n" + str(GlobalVariables.endlessCurrentLives) + " life left!"
		else:
			message.text = message.text + "\n" + str(GlobalVariables.endlessCurrentLives) + " lives left!"

func _on_restart_pressed() -> void:
	GlobalSounds.click_sound_play()
	if GlobalVariables.currentGameMode == "Story":
		if GlobalVariables.storyLevel == 1:
			get_tree().change_scene_to_file("res://scenes2d/levels2d/level_2.tscn")
		elif GlobalVariables.storyLevel == 2:
			get_tree().change_scene_to_file("res://scenes2d/levels2d/scene_2.tscn")
		else:
			get_tree().change_scene_to_file("res://world.tscn")
	else:
		get_tree().change_scene_to_file("res://world.tscn")
	
func _on_quit_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().quit()
	
func _on_main_menu_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens//main_menu.tscn")
