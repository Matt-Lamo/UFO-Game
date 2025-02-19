extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#A function which keeps track of how many objects
#the player abducts
func _keepcount() -> void:
	var cowAbductCount = 0
	var carAbductCount = 0
	
	 
	
