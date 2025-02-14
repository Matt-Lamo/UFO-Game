extends Area2D

@onready var animatedSprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@export var velocity = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func abduct(body) -> void:
	if position != body.position:
		if body.position.x > position.x:
			position.x += velocity
		else:
			position.y -= velocity
		if body.position.y > position.y:
			position.y += velocity
		else:
			position.y -= velocity
	else:
		collisionShape.disabled = true
		visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Beam":
		print("Entered Beam body") 
		abduct(body)
