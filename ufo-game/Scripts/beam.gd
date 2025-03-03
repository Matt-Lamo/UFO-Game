extends Area2D

var isOn = false
@onready var collisionShape = $CollisionShape2D
@onready var animatedSprite = $AnimatedSprite2D

func _ready() -> void:
	isOn = false
	monitorable = true
	
	
func _spaceInput() -> void:
	if Input.is_action_just_pressed("space"):
		isOn = true
	if Input.is_action_just_released("space"):
		isOn = false
		
func _process(delta: float) -> void:
	_spaceInput()
	if isOn:
		visible = true
		collisionShape.disabled = false
		collisionShape.visible = true
		
		if animatedSprite.animation == "Empty":
			animatedSprite.play("Start")
	else:
		visible = false
		animatedSprite.animation = "Empty"
		collisionShape.disabled = true

func _on_animated_sprite_2d_animation_finished() -> void:
	if animatedSprite.animation == "Start":
		animatedSprite.play("Idle")
