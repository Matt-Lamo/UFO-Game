extends AnimatedSprite2D
@onready var slowTimer = Timer.new()
var slowTime = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_cow_slow_effect() -> void:
	print("SLOW RECEIVED")
	add_child(slowTimer)
	#slowTimer.wait_time = slowTime
	#slowTimer.start()
	#slowTimer.timeout.connect(_on_slow_timer_timeout)
