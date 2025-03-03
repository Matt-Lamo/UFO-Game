extends Label

@onready var timer = $Timer

func _process(delta: float) -> void:
	set_text(str(timer.get_time_left()).pad_decimals(1))
	
