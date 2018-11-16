extends KinematicBody2D

var texture_LeftPaddle = preload("res://Sprites/PaddleLeft.png")
var texture_RightPaddle = preload("res://Sprites/PaddleRight.png")
var bool_IsLeftPaddle = true
func _ready():
	pass
	
func _init():
	pass
	
func _process(delta):
	pass

func spawnLocation (x,y): # starting position of the paddle
	position.x = x
	position.y = y
	
func setIsLeftPaddle(isLeft):
	if isLeft:
		$PaddleSprite.set_texture(texture_LeftPaddle)
		bool_IsLeftPaddle = true
	else:
		$PaddleSprite.set_texture(texture_RightPaddle)
		bool_IsLeftPaddle = false
		self.rotate(3.1415)
		
func _input(event):
		if event is InputEventScreenDrag:
			if bool_IsLeftPaddle:
				if event.position.x <= 480:
					position.y = clamp(event.position.y,35,445)
			else:
				if event.position.x > 480:
					position.y = clamp(event.position.y,35,445)

func _on_BottomSpinnerArea_body_entered(body):
	if bool_IsLeftPaddle:
		body.vec2d_VelocityNormal.y = 130 + rand_range(-20,20)
	else:
		body.vec2d_VelocityNormal.y = -130 + rand_range(-20,20)

func _on_TopSpinner_body_entered(body):
	if bool_IsLeftPaddle:
		body.vec2d_VelocityNormal.y = -130 + rand_range(-20,20)
	else:
		body.vec2d_VelocityNormal.y = 130 + rand_range(-20,20)