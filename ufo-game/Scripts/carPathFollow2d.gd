extends PathFollow2D

@onready var speed = $Car.speed
@onready var carAnimation = $Car/AnimatedSprite2D

func changeAnimation() -> void:
	if progress_ratio >= 0 and progress_ratio < 0.25:
		carAnimation.play("Left")
	elif progress_ratio >=0.25 and progress_ratio < 0.5:
		carAnimation.play("Up")
	elif progress_ratio >=0.5 and progress_ratio < 0.75:
		carAnimation.play("Right")
	elif progress_ratio >=0.75 and progress_ratio < 1:
		carAnimation.play("Down")
		
func _process(delta: float) -> void:
	progress_ratio += delta * speed
	changeAnimation()

	
		
