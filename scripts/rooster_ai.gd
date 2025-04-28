extends Control
class_name RoosterAi

# player var
#var head_position = "stred"


# Animatronic rooster var
var animatronic_random_number = 3
var animatronic_rooster_camera = 1
var game_over = 0
var animatronic_rooster_door_var = 0





func _ready() -> void:
	$"../Office/UiPc/CamFeed/X48n0".set_visible(false)
func _process(delta: float) -> void:
	$"../Office/UiPc/Cameras".text =  "CAM " + str(GlobalVars.camera_clicked) 

	if (GlobalVars.camera_clicked == animatronic_rooster_camera):
		match GlobalVars.camera_clicked:
				1:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam1Animatronic")
				2:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam2Animatronic")
				3:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam3Animatronic")
				4:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam4Animatronic")
				5:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam5Animatronic")
				6:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam6Animatronic")
				7:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam7Animatronic")
				9:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam8Animatronic")
				10:
					$"../Office/UiPc/CamFeed/CameraFeed".play("Cam9Animatronic")
					
	elif (GlobalVars.camera_clicked != animatronic_rooster_camera):
		match GlobalVars.camera_clicked:
			1:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam1Nothing")
			2:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam2Nothing")
			3:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam3Nothing")
			4:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam4Nothing")
			5:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam5Nothing")
			6:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam6Nothing")
			7:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam7Nothing")
			9:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam8Nothing")
			10:
				$"../Office/UiPc/CamFeed/CameraFeed".play("Cam9Nothing")
		
	if(GlobalVars.light_button_is_pressed == true and animatronic_rooster_camera == 8):
		$"../Office/AnimationPlayerOffice".play("animation_view_left_animatronic")
	elif(GlobalVars.light_button_is_pressed == true and animatronic_rooster_camera == 11):
		$"../Office/AnimationPlayerOffice".play("animation_view_right_animatronic")
		
	

func _on_timer_rooster_timeout() -> void:
	
	animatronic_random_number = randi_range(0, 20)
	if animatronic_rooster_camera == 11:
		cam_11()
	elif animatronic_rooster_camera == 8:
		cam_8()
	
	elif animatronic_random_number <= GlobalVars.animatronic_rooster_AI :
		match animatronic_rooster_camera:
			1:
				cam_1()
			2:
				cam_2()
			3:
				cam_3()
			4:
				cam_4()
			5:
				cam_5()
			6:
				cam_6()
			7:
				cam_7()
			9:
				cam_9()
			10:
				cam_10()

	

func cam_1():
	animatronic_rooster_camera += 1
func cam_2():
	animatronic_rooster_camera += randi_range(1,2)
func cam_3():
	animatronic_rooster_camera -= 1
func cam_4():
	animatronic_rooster_camera += randi_range(1,2)
func cam_5():
	$"../Office/WalkSound".play()
	animatronic_rooster_camera += randi_range(2,3)
func cam_6():
	$"../Office/WalkSound".play()
	animatronic_rooster_camera += randi_range(3,5)
func cam_7():
	$"../Office/WalkSound".play()
	animatronic_rooster_door_var = randi_range(1,2)
	if animatronic_rooster_door_var == 1:
		animatronic_rooster_camera += 1
	elif animatronic_rooster_door_var == 2:
		animatronic_rooster_camera -= 2
func cam_8():
	if GlobalVars.light_button_is_pressed == true:
		$"../Office/AnimationPlayerOffice".play("animation_view_left_scared_away")
		$"../Office/RunningSound".play()
		animatronic_rooster_door_var = randi_range(1,2)
		if animatronic_rooster_door_var == 1:
			animatronic_rooster_camera -= randi_range(3,4)
		elif animatronic_rooster_door_var == 2:
			animatronic_rooster_camera -= 1
	elif GlobalVars.light_button_is_pressed == false:
			#Jumpscare animace
			animatronic_random_number = 0
			game_over = 1
			get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")

func cam_9():
	$"../Office/WalkSound".play()
	animatronic_rooster_door_var = randi_range(1,3)
	if animatronic_rooster_door_var == 1:
		animatronic_rooster_camera += 1
	elif animatronic_rooster_door_var == 2:
		animatronic_rooster_camera += 2
	else:
		animatronic_rooster_camera	-= 3
	
func cam_10():
	$"../Office/WalkSound".play()
	animatronic_rooster_door_var = randi_range(1,2)
	if animatronic_rooster_door_var == 1:
		animatronic_rooster_camera -= 1
	elif animatronic_rooster_door_var == 2:
		animatronic_rooster_camera += 1
	
func cam_11():
	if GlobalVars.light_button_is_pressed == true:
		$"../Office/AnimationPlayerOffice".play("animation_view_right_scared_away")
		$"../Office/RunningSound".play()
		animatronic_rooster_door_var = randi_range(1,2)
		if animatronic_rooster_door_var == 1:
			animatronic_rooster_camera -= randi_range(5,6)
		elif animatronic_rooster_door_var == 2:
			animatronic_rooster_camera -= 2
	elif GlobalVars.light_button_is_pressed == false:
		#Jumpscare animace
		animatronic_random_number = 0
		game_over = 1
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
		
		
func _on_light_button_down() -> void:
	$"../Office/PowerUse".value += 25 
	$"../Office/FlashLightSound".play() 
	GlobalVars.light_button_is_pressed = true
	
	if(GlobalVars.view_left == true):
		$"../Office/AnimationPlayerOffice".play("animation_view_left_light")
	elif(GlobalVars.view_right == true):
		$"../Office/AnimationPlayerOffice".play("animation_view_right_light")
	else:
		pass
		

func _on_light_button_up() -> void:
	$"../Office/PowerUse".value -= 25
	$"../Office/FlashLightSound".stop()
	GlobalVars.light_button_is_pressed = false
	
	if(GlobalVars.view_left == true):
		$"../Office/AnimationPlayerOffice".play("animation_view_left_look")
	elif(GlobalVars.view_right == true):
		$"../Office/AnimationPlayerOffice".play("animation_view_right_look")
	else:
		pass
	
