extends Area2D
# Copied and pasted from cow.
@onready var animatedSprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@export var speed = 100
var timeToFullAlert = 4/5
var isAbducted = false
var collected = false
var attackPlayer = false
var seesPlayer = false
var damageTimer = Timer.new()
var countMax = 50.0
var count = countMax
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collected:
		#PUT IN SIGNAL FOR UI UPDATING AND SCOREBOARD HERE
		Global.collectedTable["Person"] += 1
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

func _shoot_at_player() -> void:
	# Algorithm:
	# if player is in radius of n pixels:
	while seesPlayer: #  When players enters radius of hostile
		add_child(damageTimer)
		damageTimer.wait_time = timeToFullAlert
		damageTimer.start()
		damageTimer.timeout.connect(_on_damage_timer_timeout)			
	# 	play shooting animation
	#  timer window, detected you (exclamation point)

func _on_soldiers_view_body_entered(body: Node2D) -> void:
	seesPlayer = true

func _on_soldiers_view_body_exited(body: Node2D) -> void:
	seesPlayer = false
	damageTimer.queue_free() 

func _on_animated_sprite_2d_2_animation_finished() -> void:
	attackPlayer = true
	
func _on_damage_timer_timeout() -> void:
	while seesPlayer and attackPlayer:
		Global.hp -= 10
	
