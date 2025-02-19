extends Area2D

@onready var animatedSprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@export var speed = 100
var isAbducted = false
var collected = false
var count = 40 
var playerPosition: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collected:
		#PUT IN SIGNAL FOR UI UPDATING AND SCOREBOARD HERE
		queue_free()
	if isAbducted:
		if scale != (Vector2(0,0)):
			count -= 1
			scale = Vector2(scale.x-.1, scale.y-.1)
		else:
			collected = true
	else:
		count = 40
		
		

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Beam":
		print("Entered Beam body") 
		playerPosition = area.position
		isAbducted = true
		
func _on_area_exited(area: Area2D) -> void:
	if area.name == "Beam":
		print("Left Beam body") 
		isAbducted = false
