extends AnimatedSprite2D
var effectCountPos = 0

func _ready() -> void:
	visible = false


func _on_player_fast_ui() -> void:
	print("FAST RECEIVED")
	effectCountPos = Global.effectCount
	Global.effectCount += 1
	match effectCountPos:
		0:
			position = Vector2(53,124)
		1:
			position = Vector2(113,124)
		2:
			position = Vector2(173,124)
		3:
			position = Vector2(233,124)
	visible = true
	play("Countdown")


func _on_animation_finished() -> void:
	visible = false
	Global.effectCount -= 1
