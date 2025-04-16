extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _shoot_at_player() -> void:
	# Algorithm:
	# if player is in radius of n pixels:
	# 	play shooting animation
	# 	fire projectile at player
	
	
	# 	if player is hit:
	#		playerHealth -= 50
	#	else:
	#		projectile disappears if it collides with anything
	pass

func _on_soldiers_view_area_entered(area: Area2D) -> void:
	if area.name == "player" :
		_shoot_at_player()
		pass
