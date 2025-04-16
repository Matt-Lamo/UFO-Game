extends CharacterBody2D

@export var speed = 225
@export var baseSpeed = 225
@onready var animatedSprite = $AnimatedSprite2D
@onready var effects = {"slow": 0,"healthup":0,"fast":0}
var slowTimer = Timer.new() #Do not modify, initializes Timer node
var fastTimer = Timer.new() #Do not modify, initializes Timer Node
@export var slowSpeed = 75 #Value subtracted from player speed, speed reduction
@export var slowTime = 5 #time effect lasts
@export var fastSpeed = 75 #Value added to player speed, speed increase
@export var fastTime = 5 #time effect lasts
signal slowUI
signal fastUI

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
	slowUI.emit()
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


func _on_cat_1_fast_effect() -> void:
	fastUI.emit()
	if effects["fast"] == 0:
		print("fast effect applied.")
		effects["fast"] = 1
		add_child(fastTimer)
		fastTimer.wait_time = fastTime
		fastTimer.start()
		speed += fastSpeed
		fastTimer.timeout.connect(_on_fast_timer_timeout)

func _on_fast_timer_timeout() -> void:
	effects["fast"] = 0
	speed = baseSpeed
	fastTimer.queue_free()
