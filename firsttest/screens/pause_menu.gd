extends Control

func _ready():
	$AnimationPlayer.play("RESET")
	hide()
	
func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()

func pause():
	get_tree().paused = true
	$Pause.play()
	$AnimationPlayer.play("blur")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	show()

func testEsc():
	if Input.is_action_just_pressed("Pause") and get_tree().paused == false:
		pause()
		print("paused!")
	elif Input.is_action_just_pressed("Pause") and get_tree().paused == true:
		resume()
		print("unpaused!")
		

func _on_resume_pressed() -> void:
	resume()


func _on_main_menu_pressed() -> void:
	resume()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().change_scene_to_file("res://screens/main_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _process(delta):
	testEsc()
