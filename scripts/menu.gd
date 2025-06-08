extends Control


func _ready() -> void:
	var err = GlobalVars.config.load("res://save.cfg")	
	if err != OK:
		GlobalVars.config = ConfigFile.new()
		GlobalVars.config.set_value("night number", "night", 1)
		GlobalVars.config.save("res://save.cfg")
	else:
		GlobalVars.night = GlobalVars.config.get_value("night number", "night", GlobalVars.night)
	
	match GlobalVars.night:
		1:
			$BackGround.play("Night1")
		2:
			$BackGround.play("Night2")
		3:
			$BackGround.play("Night3")
		4:
			$BackGround.play("Night4")
		5:
			$BackGround.play("Night5")
		6:
			$BackGround.play("Night6")
		
	
func _on_play_pressed() -> void:
	load_night()
	$"Caves-of-dawn-10376".stop()
	$Menu/Background/MenuStatic.stop()
	$StartButtonSound.play()
	$LoadingScreen/NightNumber.text = "NIGHT " + str(GlobalVars.night)
	$Menu.set_visible(false)
	$LoadingScreen.set_visible(true)
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
func load_night():
	match GlobalVars.night:
		1:
			GlobalVars.golden_s_AI = 0
			GlobalVars.animatronic_rooster_AI = 3
		2:
			GlobalVars.golden_s_AI = 1
			GlobalVars.animatronic_rooster_AI = 5
		3:
			GlobalVars.golden_s_AI = 3
			GlobalVars.animatronic_rooster_AI = 7
		4:
			GlobalVars.golden_s_AI = 4
			GlobalVars.animatronic_rooster_AI = 9
		5:
			GlobalVars.golden_s_AI = 6
			GlobalVars.animatronic_rooster_AI = 12
		6:
			GlobalVars.golden_s_AI = 20
			GlobalVars.animatronic_rooster_AI = 20
	
func _on_options_pressed() -> void:
	$Menu/ClickSound.play()
	show_and_hide($Settings, $Menu)
	
func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_quit_pressed() -> void:
	$Menu/ClickSound.play()
	get_tree().quit()


func _on_play_mouse_entered() -> void:
	$Menu/HoverSound.play()


func _on_options_mouse_entered() -> void:
	$Menu/HoverSound.play()


func _on_quit_mouse_entered() -> void:
	$Menu/HoverSound.play()


func _on_exit_pressed() -> void:
	$Menu/ClickSound.play()
	show_and_hide($Menu, $Settings)


func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_master_volume_value_changed(value: float) -> void:
	volume(0,linear_to_db(value))
	

func _on_vfx_value_changed(value: float) -> void:
	volume(2,linear_to_db(value))
	

func _on_ambience_value_changed(value: float) -> void:
	volume(1,linear_to_db(value))


func _on_exit_mouse_entered() -> void:
	$Menu/HoverSound.play()
