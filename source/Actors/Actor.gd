extends KinematicBody2D
class_name Actor

const bulletPath = preload("res://source/Other/MVPProjectile.tscn")

const GRAVITY = 30
const WALK_SPEED = 200
const JUMP_SPEED = 900

var velocity = Vector2()



func _physics_process(delta):
	velocity.y = velocity.y + GRAVITY

	print(velocity.y)

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		
	if Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP_SPEED
	
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0
	
	elif Input.is_action_just_pressed("shoot"):
		shoot()
		
		$Node2D.look_at(get_global_mouse_position())
	

	
		
	

	
	move_and_slide(velocity, Vector2(0, -1))

func shoot():
	var bullet = bulletPath.instance()
	
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Position2D.global_position
	
	bullet.velocity = get_global_mouse_position() - bullet.position
