extends Node

func health_death_sound_play():
	$DeathSound.play()

func jumpscare_death_sound_play():
	$JumpscareSound.play()
	
func main_menu_music_play():
	if not $MainMenuMusic.playing:
		$MainMenuMusic.play()
	
func main_menu_music_stop():
	$MainMenuMusic.stop()

func click_sound_play():
	$Click.play()
