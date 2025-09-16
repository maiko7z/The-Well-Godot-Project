extends Control

func _ready() -> void:
	GlobalSounds.main_menu_music_play()

func _on_start_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens/gamemode_select.tscn")

func _on_version_notes_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens/version_notes.tscn")
	
func _on_controls_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens/controls.tscn")
	
func _on_credits_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens/credits.tscn")

func _on_quit_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().quit()
 
