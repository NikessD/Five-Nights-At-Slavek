extends Control

# player var
var head_position = "stred"


# Animatronic var
#var animatronic_random_number = 0
#var GlobalVars.animatronic_rooster_AI  = 1
#var animatronic_rooster_camera = 0
var hour = 0
var game_over = 0

# player var
var power = 100
var power_down_check = 0

# sound var
var ominious_sound_number = 0

# GoldenS var

var GoldenS_random_number = 1
var GoldenS_camera = 0
var GoldenS_timer = 0
var GoldenS_anger = 0

func _ready() -> void:
	$PowerUse.value = 10
	$AnimationPlayerOffice.play("animation_view_front")
	GlobalVars.view_front = true




func _process(delta: float) -> void:
	if hour == 6:
		get_tree().change_scene_to_file("res://scenes/night_win_screen.tscn")
	if GlobalVars.light_button_is_pressed == true:
		power -= 0.01
	if power > 0:
		power -= 0.003
	power = snapped(power,0.001)
	$UiPc/Power.text = str(power) + " POWER"
	
	if power <= 0 and power_down_check == 0:
		power_down_check = 1
		$UiPc.set_visible(false)
		$Buttons.set_visible(false)
		$PowerDownSound.play()
		await get_tree().create_timer(10).timeout
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
		

	ominious_sound_number = randi_range(0,100000)
	match ominious_sound_number:
		1:
			$OminiousSound1.play()
		2:
			$OminiousSound2.play()
		3:
			$OminiousSound3.play()

	if GoldenS_anger >= 299:
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
	if GoldenS_camera == GlobalVars.camera_clicked and GlobalVars.view_front == true:
		$"UiPc/CamFeed/SlávekLinus-Kopie".set_visible(true)
		GoldenS_anger = min(GoldenS_anger + 100 * delta, 300)
	else:
		GoldenS_anger = 0
		$"UiPc/CamFeed/SlávekLinus-Kopie".set_visible(false)


# Pravý pohyb hráče
func _on_button_right_side_mouse_entered() -> void:
	if GlobalVars.view_front == true:
			GlobalVars.view_right = true
			GlobalVars.view_front = false
			$AnimationPlayerOffice.play("animation_view_right")
			$UiPc.set_visible(false)
			$Buttons.set_visible(false)
			await get_tree().create_timer(0.4).timeout
			$Buttons.set_visible(true)
			$Light.set_visible(true)

	elif GlobalVars.view_left == true:
		GlobalVars.view_front = true
		GlobalVars.view_left = false
		$AnimationPlayerOffice.play("animation_view_left_back")
		$Light.set_visible(false)
		$Buttons.set_visible(false)
		await get_tree().create_timer(0.4).timeout
		$Buttons.set_visible(true)
		$UiPc.set_visible(true)

# Levý pohyb hráče
func _on_button_left_side_mouse_entered(): 
	if GlobalVars.view_front == true:
		GlobalVars.view_left = true
		GlobalVars.view_front = false
		$AnimationPlayerOffice.play("animation_view_left")
		$UiPc.set_visible(false)
		$Buttons.set_visible(false)
		await get_tree().create_timer(0.4).timeout
		$Buttons.set_visible(true)
		$Light.set_visible(true)
		
	elif GlobalVars.view_right == true:
		GlobalVars.view_front = true
		GlobalVars.view_right = false
		$AnimationPlayerOffice.play("animation_view_right_back")
		$Light.set_visible(false)
		$Buttons.set_visible(false)
		await get_tree().create_timer(0.4).timeout
		$Buttons.set_visible(true)
		$UiPc.set_visible(true)


# Pohyb
#func _on_timer_rooster_timeout() -> void:
	#animatronic_random_number = randi_range(0, 20)
	#
	#if GlobalVars.animatronic_rooster_AI  <= animatronic_random_number:
		#if animatronic_rooster_camera == 6 and GlobalVars.light_button_is_pressed == true:
			#animatronic_rooster_camera += randi_range(-3,0)
			#$RunningSound.play()
		#elif animatronic_rooster_camera == 9 and GlobalVars.light_button_is_pressed == true:
			#animatronic_rooster_camera += randi_range(-6,-4)
			#$RunningSound.play()
		#elif animatronic_rooster_camera == 6 and GlobalVars.light_button_is_pressed == false :
			## Jumpscare animace
			#animatronic_random_number = 0
			#game_over = 1
			#get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
			#
		#elif animatronic_rooster_camera == 9 and GlobalVars.light_button_is_pressed == false :
			## Jumpscare animace
			#animatronic_random_number = 0
			#game_over = 1
			#get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
			#
		#else:
			#if animatronic_rooster_camera == 5:
				#animatronic_rooster_camera += randi_range(1,2)
				#$WalkSound.play()
			#elif animatronic_rooster_camera < 4:
				#animatronic_rooster_camera += randi_range(1,2)
				#absi(animatronic_rooster_camera)
				#
			#else:
				#animatronic_rooster_camera += 1
				#
				#if animatronic_rooster_camera >= 7:
					#$WalkSound.play()
					#
				#elif animatronic_rooster_camera == 5:
					#$WalkSound.play()
	#else:
		#pass

#Hodiny
func _on_timer_hour_timeout() -> void:
	hour += 1
	$UiPc/GameHour.text = str(hour) + " AM"
	


#func _on_light_button_down() -> void:
	#$PowerUse.value += 25
	#$FlashLightSound.play()
	#GlobalVars.light_button_is_pressed = true
#
#func _on_light_button_up() -> void:
	#$PowerUse.value -= 25
	#$FlashLightSound.stop()
	#GlobalVars.light_button_is_pressed = false

func _on_golden_s_timer_timeout() -> void:
	GoldenS_camera = 0
	GoldenS_random_number = randi_range(0, 20)
	if GoldenS_random_number <= GlobalVars.golden_s_AI:
		GoldenS_camera = randi_range(0, 11)
		GoldenS_timer = randi_range(80, 120) / GlobalVars.golden_s_AI
		await get_tree().create_timer(GoldenS_timer).timeout

	else:
		pass


func _on_button_8_pressed() -> void:
	GlobalVars.camera_clicked = 9
	$CamSelected.play()

func _on_button_2_pressed() -> void:
	GlobalVars.camera_clicked = 1
	$CamSelected.play()

func _on_button_3_pressed() -> void:
	GlobalVars.camera_clicked = 5
	$CamSelected.play()

func _on_button_4_pressed() -> void:
	GlobalVars.camera_clicked = 2
	$CamSelected.play()
func _on_button_5_pressed() -> void:
	GlobalVars.camera_clicked = 4
	$CamSelected.play()

func _on_button_7_pressed() -> void:
	GlobalVars.camera_clicked = 7
	$CamSelected.play()

func _on_button_9_pressed() -> void:
	GlobalVars.camera_clicked = 10
	$CamSelected.play()


func _on_button_6_pressed() -> void:
	GlobalVars.camera_clicked = 6
	$CamSelected.play()


func _on_button_pressed() -> void:
	GlobalVars.camera_clicked = 3
	$CamSelected.play()
