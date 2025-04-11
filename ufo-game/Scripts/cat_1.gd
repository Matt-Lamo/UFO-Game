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
var randi = 0
var randint = 0
signal fastEffect

func _ready() -> void:
	animatedSprite.play("Idle")
	
	
func _process(delta: float) -> void:
	if collected:
		#PUT IN SIGNAL FOR UI UPDATING AND SCOREBOARD HERE
		Global.collectedTable["Cat"] += 1
		print("COLLECTED")
		print(Global.collectedTable)
		randint = rng.randi_range(0,0) #ADJUST PERCENT CHANGE
		if randint == 0:
			fastEffect.emit() 
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
