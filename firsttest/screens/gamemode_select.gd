extends Control

func _ready() -> void:
	if GlobalVariables.storyLevel > 0:
		$VBoxContainer/StoryContinue.text = "Continue Story\n(Lvl " + str(GlobalVariables.storyLevel) + ")"
	else:
		$VBoxContainer/StoryContinue.text = "Continue Story"
		$VBoxContainer/StoryContinue.disabled = true
	if GlobalVariables.endlessLevel > 0:
		$VBoxContainer/EndlessContinue.text = "Continue Endless\n(Lvl " + str(GlobalVariables.endlessLevel) + ")"
	else:
		$VBoxContainer/EndlessContinue.text = "Continue Endless"
		$VBoxContainer/EndlessContinue.disabled = true
	if GlobalVariables.storyCompleted == true:
		$StoryModeComplete.visible = true
	if GlobalVariables.endlessBestLevel > 0:
		$EndlessBest.text = "Endless High Score: "+ str(GlobalVariables.endlessBestLevel)

func _on_new_story_pressed() -> void:
	GlobalSounds.click_sound_play()
	GlobalVariables.currentGameMode = "Story"
	GlobalVariables.storyLevel = 0
	get_tree().change_scene_to_file("res://scenes2d/levels2d/level_1.tscn")
	GlobalSounds.main_menu_music_stop()

func _on_continue_story_pressed() -> void:
	GlobalSounds.click_sound_play()
	GlobalVariables.currentGameMode = "Story"
	#GlobalVariables.storyLevel = 0
	get_tree().change_scene_to_file("res://world.tscn")
	GlobalSounds.main_menu_music_stop()

func _on_new_endless_pressed() -> void:
	GlobalSounds.click_sound_play()
	GlobalVariables.currentGameMode = "Endless"
	GlobalVariables.endlessLevel = 1
	GlobalVariables.endlessCurrentLives = 3
	get_tree().change_scene_to_file("res://world.tscn")
	GlobalSounds.main_menu_music_stop()

func _on_continue_endless_pressed() -> void:
	GlobalSounds.click_sound_play()
	GlobalVariables.currentGameMode = "Endless"
	get_tree().change_scene_to_file("res://world.tscn")
	GlobalSounds.main_menu_music_stop()

func _on_back_button_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens/main_menu.tscn")
 
