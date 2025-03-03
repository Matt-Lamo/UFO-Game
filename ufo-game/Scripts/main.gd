extends Node2D
@onready var asp = $AudioStreamPlayer
@onready var gameOverLabel = $"GameOverScreen/Label"
@onready var gameOver = $"GameOverScreen"
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameOver.visible = false
	player.get_tree().paused = false
	Engine.time_scale = 1
	_playmusic()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#A function which keeps track of how many objects
#the player abducts
func _keepcount() -> void:
	var cowAbductCount = 0
	var carAbductCount = 0
	
func _playmusic() ->void:
	var loadedSong = load("res://Sounds/Music/UFO Game Looped Version.wav")
	asp.stream = loadedSong
	asp.play()
	
func _on_timer_timeout() -> void:
	gameOver.visible = true
	Engine.time_scale = 0.20
	#player.get_tree().paused = true
	gameOverLabel.set_text("Game Over.")


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()
