extends Node2D


func _ready() -> void:
	$GameOverSound.play()

func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
