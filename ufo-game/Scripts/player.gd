extends CharacterBody2D

@export var speed = 225
@export var baseSpeed = 225
@onready var animatedSprite = $AnimatedSprite2D
@onready var effects = {"slow": 0,"healthup":0}
var slowTimer = Timer.new() #Do not modify, initializes Timer node
@export var slowSpeed = 75 #Value subtracted from player speed, speed reduction
@export var slowTime = 5 #time effect lasts

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	match input_direction:
		"left":
			pass
		"right":
			pass
		"up":
			animatedSprite.animation.set("Up")
		"down":
			animatedSprite.animation.set("Down")
			
	velocity = input_direction * speed


func _effectCheck() -> void:
	if effects["slow"] == 1:
		pass
		
		
	
func _physics_process(delta):
	get_input()
	move_and_slide()


func _on_cow_slow_effect() -> void:
	if effects["slow"] == 0:
		print("slow effect applied.")
		effects["slow"] = 1
		add_child(slowTimer)
		slowTimer.wait_time = slowTime
		slowTimer.start()
		speed -= slowSpeed
		slowTimer.timeout.connect(_on_slow_timer_timeout)

func _on_slow_timer_timeout() -> void:
	effects["slow"] = 0
	speed = baseSpeed
	slowTimer.queue_free()
	
