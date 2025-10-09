extends Control
@onready var message = $CenterContainer/VBoxContainer/LoreLabel
var tween = create_tween()

func _ready() -> void:
	randomize()
	%RetryButton.pressed.connect(_on_restart_pressed)
	%MainMenuButton.pressed.connect(_on_main_menu_pressed)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	%QuitButton.pressed.connect(_on_quit_pressed) 
	var textChoice = RandomNumberGenerator.new().randf_range(0,10)
	if textChoice < 2.5: 
		message.text = "Your mind blanks, full of pain... \n...but hungry for answers."
	elif textChoice >= 2.5 and textChoice < 5:
		message.text = "Lost in thought again... \n...why can't you remember?"
	elif textChoice >= 5 and textChoice < 7.5:
		message.text = "The answer, again, just out of reach."
	elif textChoice >= 7.5:
		message.text = "Why do you hide the truth from yourself?"
	
	tween.tween_property($Background, "color", Color(0,0,0,1), 1.0)
	
	if GlobalVariables.currentGameMode == "Story":
		if GlobalVariables.storyLevel == 5:
			message.text = "Don't you remember?\nYou let her fall in. It's all your fault."
		%RetryButton.text = "Retry? ( Level " + str(GlobalVariables.storyLevel) + " )"
		$NoLivesLeft.play()
	else:
		GlobalVariables.endlessCurrentLives -= 1
		if GlobalVariables.endlessCurrentLives <= 0:
			%RetryButton.visible = false
			$CenterContainer/VBoxContainer/GameOverLabel.text = "GAME OVER"
			message.text = message.text + "\nNo lives left."
			GlobalVariables.endlessLevel = 0
			GlobalVariables.endlessCurrentLives = 3
			$NoLivesLeft.play()
		else:
			$LifeLost.play()
			%RetryButton.text = "Retry? ( Level " + str(GlobalVariables.endlessLevel) + " )"
			if GlobalVariables.endlessCurrentLives == 1:
				message.text = message.text + "\n" + str(GlobalVariables.endlessCurrentLives) + " life left!"
			else:
				message.text = message.text + "\n" + str(GlobalVariables.endlessCurrentLives) + " lives left!"
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
