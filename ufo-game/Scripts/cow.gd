extends Area2D

@onready var animatedSprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@export var speed = 100
var isAbducted = false
var collected = false
var countMax = 50.0
var count = countMax
var rng = RandomNumberGenerator.new()
var randint = 0
signal slowEffect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collected:
		#PUT IN SIGNAL FOR UI UPDATING AND SCOREBOARD HERE
		Global.collectedTable["Cow"] += 1
		print("COLLECTED")
		print(Global.collectedTable)
		randint = rng.randi_range(0,4)
		if randint == 0:
			slowEffect.emit()
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
