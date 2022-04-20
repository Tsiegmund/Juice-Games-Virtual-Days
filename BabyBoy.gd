extends KinematicBody2D

var timer = Timer.new()
var rng = RandomNumberGenerator.new()

const GRAVITY = 200.0
const WALK_SPEED = 200
const JUMP_SPEED = 100

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	var state = rng.randi_range(0, 3)
	print(state)
	
	# Stay still
	if state == 0:
		pass
		
	# Right
	elif state == 1:
		velocity.x = -WALK_SPEED
		
		
	# Left
	elif state == 2:
		velocity.x = WALK_SPEED
		
	# Jump
	elif state == 3 and is_on_floor():
		velocity.y = -JUMP_SPEED
