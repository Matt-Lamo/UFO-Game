extends PathFollow2D

@onready var speed = $Car.speed
@onready var carAnimation = $Car/AnimatedSprite2D

func changeAnimation() -> void:
	if progress_ratio >= 0 and progress_ratio < 0.25:
		if is_instance_valid(carAnimation):
			carAnimation.animation="Left"
	elif progress_ratio >=0.25 and progress_ratio < 0.5:
		if is_instance_valid(carAnimation):
			carAnimation.animation="Up"
	elif progress_ratio >=0.5 and progress_ratio < 0.75:
		if is_instance_valid(carAnimation):
			carAnimation.animation="Right"
	elif progress_ratio >=0.75 and progress_ratio < 1:
		if is_instance_valid(carAnimation):
			carAnimation.animation="Down"
		
func _process(delta: float) -> void:
	progress_ratio += delta * speed
	changeAnimation()

	
		
