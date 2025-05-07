extends Area2D
# Copied and pasted from cow.
@onready var animatedSprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@onready var asp = $AudioStreamPlayer
@export var speed = 100

var timeToFullAlert = 4/5
var isAbducted = false
var collected = false
var attackPlayer = false
var seesPlayer = false
@onready var healthTimer = $Timer
var countMax = 50.0
var count = countMax
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	healthTimer.start()
	healthTimer.timeout.connect(_on_health_timer_timeout)
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D2.visible = false
	
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

func _on_soldiers_view_body_entered(body: Node2D) -> void:
	seesPlayer = true
	$AnimatedSprite2D2.visible = true
	$AnimatedSprite2D2.play("alertAnimation")
	
func _on_soldiers_view_body_exited(body: Node2D) -> void:
	seesPlayer = false
	$AnimatedSprite2D2.visible = false

func _on_animated_sprite_2d_2_animation_finished() -> void:
	attackPlayer = true

func _on_health_timer_timeout() -> void:
	if seesPlayer and attackPlayer:
		#Play damage sound
		_playsound()
		Global.hp -= 10
		Global.hp = clamp(Global.hp, -10, 100)

func _playsound() ->void:
	var loadedSong = load("res://Sounds/SFX/gun-shot-1-7069.mp3")
	asp.stream = loadedSong
	asp.play()
