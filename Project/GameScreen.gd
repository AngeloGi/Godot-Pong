extends Node
var object_LeftPaddle = null
var object_RightPaddle = null

func _ready():
	object_LeftPaddle = load("res://Paddle.tscn").instance()
	object_RightPaddle = load("res://Paddle.tscn").instance()
	
	object_LeftPaddle.spawnLocation(80,240)
	object_RightPaddle.spawnLocation(880,240)

	object_LeftPaddle.setIsLeftPaddle(true)
	object_RightPaddle.setIsLeftPaddle(false)

	add_child(object_LeftPaddle)
	add_child(object_RightPaddle)

	pass
	
func _init():
	pass
	
func _process(delta):
	pass