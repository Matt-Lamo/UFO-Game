extends Area2D


@onready var animatedSprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@export var speed = 0.1
var isAbducted = false
var collected = false
var countMax = 50.0
var count = countMax
var playerPosition: Vector2
var position_last_frame := Vector2()
var cardinal_direction = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true

func detect_direction():
	var motion = position - position_last_frame

	if motion.length() > 0.0001:
		
		cardinal_direction = int(4.0 * (motion.rotated(PI / 4.0).angle() + PI) / TAU)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collected:
		#PUT IN SIGNAL FOR UI UPDATING AND SCOREBOARD HERE
		Global.collectedTable["Car"] += 1
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
	detect_direction()
	match cardinal_direction:
		0: #West
			animatedSprite.play("Left")
		1: #North
			animatedSprite.play("Up")
		2: #East
			animatedSprite.play("Right")
		3: #South
			animatedSprite.play("Down")
			
		

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Beam":
		print("Entered Beam body") 
		playerPosition = area.position
		isAbducted = true
		
func _on_area_exited(area: Area2D) -> void:
	if area.name == "Beam":
		print("Left Beam body") 
		isAbducted = false
