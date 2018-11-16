extends Node

var object_LeftPaddle = null
var object_RightPaddle = null
var object_Ball = null
var int_LeftPlayerScore = 0
var int_RightPlayerScore = 0

func _ready():
	object_LeftPaddle = load("res://Paddle.tscn").instance()
	object_RightPaddle = load("res://Paddle.tscn").instance()
	object_LeftPaddle.spawnLocation(80,240)
	object_RightPaddle.spawnLocation(880,240)
	object_LeftPaddle.setIsLeftPaddle(true)
	object_RightPaddle.setIsLeftPaddle(false)
	add_child(object_LeftPaddle)
	add_child(object_RightPaddle)
	
	object_Ball = load("res://Ball.tscn").instance()
	object_Ball.spawnLocation(480,240)
	add_child(object_Ball)

func _init():
	pass
	
func _process(delta):
	pass
	
func increasePlayerScore(player):
	if player:
		int_LeftPlayerScore += 1
		$"Player Score".text = str(int_LeftPlayerScore) + "-" + str(int_RightPlayerScore)
	else:
		int_RightPlayerScore += 1
		$"Player Score".text = str(int_LeftPlayerScore) + "-" + str(int_RightPlayerScore)