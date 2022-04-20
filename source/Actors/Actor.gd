extends KinematicBody2D
class_name Actor

var timer = Timer.new()

const GRAVITY = 200.0
const WALK_SPEED = 200
const JUMP_SPEED = 900

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	move_and_slide(velocity, Vector2(0, -1))
