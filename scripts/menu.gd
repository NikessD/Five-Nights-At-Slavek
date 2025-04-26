extends Control

func _on_play_pressed() -> void:
	$Menu/Background/MenuStatic.stop()
	$StartButtonSound.play()
	$LoadingScreen/NightNumber.text = "NIGHT " + str(GlobalVars.night_number)
	$Menu.set_visible(false)
	$LoadingScreen.set_visible(true)
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	$LoadingScreen/NightNumber
	
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
