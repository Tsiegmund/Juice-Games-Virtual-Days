extends KinematicBody2D

var timer = Timer.new()
var rng = RandomNumberGenerator.new()
var GRAVITY = 30

var ENEMY_HEALTH = 128

var WALK_SPEED = 200
var JUMP_SPEED = 400
var velocity = Vector2()

#MODE_KINEMATIC:
func _physics_process(delta):
	
	velocity.y = velocity.y + GRAVITY
	if is_on_floor():
		velocity.y = 0
	if velocity.y > 2000:
		velocity.y = 2000
	#var state = rng.randi_range(0, 3)
	# Stay still
	#if state == 0:
		timer.set_wait_time(600)
	# Right
	#if state == 1:
#		velocity.x = -WALK_SPEED
#		timer.set_wait_time(600)
	# Left
	#if state == 2:
#		velocity.x = WALK_SPEED
#		timer.set_wait_time(600)
		 # Jump
	#if state == 3 and is_on_floor():
#		velocity.y = -JUMP_SPEED
#		timer.set_wait_time(5)
		
		
	move_and_slide(velocity, Vector2(0, -1))
