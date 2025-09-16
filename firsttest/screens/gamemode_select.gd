extends Control

func _ready() -> void:
	if GlobalVariables.storyLevel > 0:
		$VBoxContainer/StoryContinue.text = "Story Mode\n(CONTINUE - Lvl " + str(GlobalVariables.storyLevel) + ")"
	else:
		$VBoxContainer/StoryContinue.text = "Story Mode\n(CONTINUE)"
	if GlobalVariables.endlessLevel > 0:
		$VBoxContainer/EndlessContinue.text = "Endless Mode\n(CONTINUE - Lvl " + str(GlobalVariables.endlessLevel) + ")"
	else:
		$VBoxContainer/EndlessContinue.text = "Endless Mode\n(CONTINUE)"

func _on_new_story_pressed() -> void:
	GlobalSounds.click_sound_play()
	GlobalVariables.currentGameMode = "Story"
	GlobalVariables.storyLevel = 0
	get_tree().change_scene_to_file("res://tutorial_level.tscn")
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
	GlobalVariables.endlessLevel = 0
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
 
