extends Control


func _on_back_button_pressed() -> void:
	GlobalSounds.click_sound_play()
	get_tree().change_scene_to_file("res://screens/main_menu.tscn")
