extends Area2D

@onready var animatedSprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@export var speed = 100
var isAbducted = false
var collected = false
var countMax = 30.0
var count = countMax
var tempPosition = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	tempPosition = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collected:
		#PUT IN SIGNAL FOR UI UPDATING AND SCOREBOARD HERE
		Global.collectedTable["Trash"] += 1
		print("COLLECTED")
		print(Global.collectedTable)
		queue_free()
	if isAbducted:
		
		if count !=0:
			print(count)
			count -= 1.0
			position.y -= (16/countMax)
		else:
			collected = true
	else:
		count = countMax
		position = tempPosition
		
		

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Beam":
		print("Trash entered Beam body") 
		isAbducted = true
		
func _on_area_exited(area: Area2D) -> void:
	if area.name == "Beam":
		print("Left Beam body") 
		isAbducted = false
