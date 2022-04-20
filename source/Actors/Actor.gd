extends KinematicBody2D
class_name Actor

const GRAVITY = 30
const WALK_SPEED = 200
const JUMP_SPEED = 900

var velocity = Vector2()

func _physics_process(delta):
	velocity.y = velocity.y + GRAVITY

	print(velocity.y)

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	
	elif Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP_SPEED

	else:
		velocity.x = 0
		
	
	move_and_slide(velocity, Vector2(0, -1))


