extends CharacterBody2D

@onready var collisionShape = $CollisionShape2D
@onready var animatedSprite = $AnimatedSprite2D


func _ready() -> void:
	visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
