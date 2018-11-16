extends KinematicBody2D

var vec2d_Velocity = Vector2()
var vec2d_VelocityNormal
var bool_BallStartingSide = 1
var object_Moving = null
var justScored = false

func _ready():
	pass
	
func _init():
	spawnLocation()
	startingSide()
	vec2d_VelocityNormal = vec2d_Velocity.normalized() * 250
	justScored = false

func _physics_process(delta):
	object_Moving = move_and_collide(vec2d_VelocityNormal * delta)
	if object_Moving:
		vec2d_VelocityNormal = vec2d_VelocityNormal.bounce(object_Moving.normal)
		if vec2d_VelocityNormal.x < 800:
			vec2d_VelocityNormal.x *= 1.03
			
	if position.x < 0:
		if !justScored:
			justScored = true
			yield(get_tree().create_timer(2),"timeout")
			get_parent().increasePlayerScore(0)
			vec2d_VelocityNormal.x = 0
			vec2d_VelocityNormal.y = 0
			object_Moving = null
			vec2d_Velocity = Vector2()
			_init()
		
	if position.x > 960:
		if !justScored:
			justScored = true
			yield(get_tree().create_timer(2),"timeout")
			get_parent().increasePlayerScore(1)
			vec2d_VelocityNormal.x = 0
			vec2d_VelocityNormal.y = 0
			object_Moving = null
			vec2d_Velocity = Vector2()
			_init()

func spawnLocation (x = 480,y = 240): # starting position of the paddle
	position.x = x
	position.y = y
	
func startingSide():
	randomize()
	bool_BallStartingSide = rand_range(0,1)
	if bool_BallStartingSide <= 0.5:
		bool_BallStartingSide = -1
	else:
		bool_BallStartingSide = 1
	vec2d_Velocity.x = bool_BallStartingSide