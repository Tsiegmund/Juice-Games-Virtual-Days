extends KinematicBody2D

signal health_updated(health)
signal killed()

var is_moving_left = true

var gravity = 10
var velocity = Vector2(0, 0)
export (float) var max_health = 100

onready var health = max_health setget _set_health
onready var invulnerability_timer = $Invulnerability

var prev_health = 100
var speed = 32

func _ready():
	$AnimationPlayer.play("Walk")

func _process(_delta):
	move_character()
	detect_turn_around()
	
func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x

func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
	_set_health(health - amount)
	print("Damage taken!")

func kill():
	pass
	
func _set_health(value):
	health = clamp(value, 0, max_health)
	if health != prev_health:
		emit_signal("health_updated", health)
	if health == 0:
		kill()
		emit_signal("killed")
