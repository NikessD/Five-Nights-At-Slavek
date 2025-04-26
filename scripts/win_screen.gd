extends Control


func _ready() -> void:
	$"Deep-strange-whoosh-183845".play()
	$Night.text = "NIGHT " + str(GlobalVars.night_number)  
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_timer_night_timeout() -> void:
	GlobalVars.night_number += 1
	$Night.text = "NIGHT " + str(GlobalVars.night_number) 
