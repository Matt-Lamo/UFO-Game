extends CanvasLayer
@onready var slow = $Slow


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_cow_slow_effect() -> void:
	
	slow.visible = true
	slow.animation.play("Countdown")
	
func _on_slow_timer_timeout() -> void:
	slow.visible = false
