extends Area2D

@onready var animatedSprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@export var speed = 0.5
var isAbducted = false
var collected = false
var countMax = 50.0
var count = countMax
var velocity = Vector2(0,0)
var moveCounter = true
var rng = RandomNumberGenerator.new()
@onready var newPosition = Vector2(position.x+randf_range(-8,8),position.y+randf_range(-8,8))
var randx = 0
var randy = 0
func wait(seconds:float) -> void:
	await get_tree().create_timer(seconds).timeout
	
	
func _ready() -> void:
	monitoring = true
	animatedSprite.play("Idle")
	rng.randomize()
	
func update_animation() -> void:
	if randx > 0:
		animatedSprite.flip_h = true
	else:
		animatedSprite.flip_h = false
	
func random_movement() -> void:
	animatedSprite.play("Running")
	if position.distance_to(newPosition)<1.0:
		
		randx = randf_range(-4,4)
		randy = randf_range(-4,4)
		newPosition = Vector2(position.x+randx,position.y+randy)
		
	position = position.move_toward(newPosition, speed)
	
	
func _physics_process(delta: float) -> void:
	random_movement()
	
	
func _process(delta: float) -> void:
	update_animation()
	if collected:
		#PUT IN SIGNAL FOR UI UPDATING AND SCOREBOARD HERE
		Global.collectedTable["Rat"] += 1
		print("COLLECTED")
		print(Global.collectedTable)
		queue_free()
	if isAbducted:
		if count !=0:
			print(count)
			count -= 1.0
			scale = Vector2(1*(float(count/countMax)), 1*(float(count/countMax)))
		else:
			collected = true
	else:
		count = countMax
		scale = Vector2(1,1)


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Beam":
		print("Entered Beam body") 
		isAbducted = true
		
		
func _on_area_exited(area: Area2D) -> void:
	if area.name == "Beam":
		print("Left Beam body") 
		isAbducted = false


func _on_timer_timeout() -> void:
	moveCounter = true
