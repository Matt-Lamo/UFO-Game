extends Node2D
@onready var asp = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	var loadedSong = load("res://Sounds/Music/UFO Game (3).wav")
	asp.stream = loadedSong
	asp.play()
	
