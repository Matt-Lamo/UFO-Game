extends CharacterBody2D

@export var speed = 225
@onready var animatedSprite = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	match input_direction:
		"left":
			pass
		"right":
			pass
		"up":
			animatedSprite.animation.play("Up")
		"down":
			animatedSprite.animation.play("Down")
			
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
