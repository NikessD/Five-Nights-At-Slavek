extends Control

@export 
var bus_name: String

var bus_index: int

#func _ready() -> void:
#	bus_index = AudioServer.get_bus_index(bus_name)
	
	
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")


func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value))
