extends PathFollow2D

@onready var speed = $Car.speed


func _process(delta: float) -> void:
	progress_ratio += delta * speed
	
