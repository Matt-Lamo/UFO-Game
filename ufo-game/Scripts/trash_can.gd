extends Area2D

@onready var animatedSprite = $AnimatedSprite2D
var spawnTriggered = false
var rng = RandomNumberGenerator.new()
var randnum = 0
@onready var trash1Scene: PackedScene = preload("res://Scenes/trash1.tscn")
@onready var trash2Scene: PackedScene = preload("res://Scenes/trash2.tscn")
@onready var trash3Scene: PackedScene = preload("res://Scenes/trash3.tscn")
@onready var trash4Scene: PackedScene = preload("res://Scenes/trash4.tscn")
@onready var ratScene: PackedScene = preload("res://Scenes/Rat.tscn")

func _ready() -> void:
	spawnTriggered = false


func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Beam":
		print("Entered Beam body") 
		animatedSprite.play("Shaking")
		if spawnTriggered == false:
			spawnTriggered = true
			randnum = rng.randi_range(0,4)
			match randnum:
				0: #spawn rat
					var ratTemp = ratScene.instantiate()
					add_child(ratTemp)
				1: #spawn trash1
					var trash1Temp = trash1Scene.instantiate()
					add_child(trash1Temp)
				2: #spawn trash2
					var trash2Temp = trash2Scene.instantiate()
					add_child(trash2Temp)
				3: #spawn trash3
					var trash3Temp = trash3Scene.instantiate()
					add_child(trash3Temp)
				4: #spawn trash4
					var trash4Temp = trash4Scene.instantiate()
					add_child(trash4Temp)


func _on_area_exited(area: Area2D) -> void:
	if area.name == "Beam":
		print("Entered Beam body") 
		animatedSprite.play("Idle")
