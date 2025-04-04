extends Control

@onready var newGameButton = $Control/VBoxContainer/NewGame

func _ready() -> void:
	newGameButton.grab_focus()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	

func _on_quit_game_pressed() -> void:
	get_tree().quit()
