extends KinematicBody2D 

var velocity = Vector2(0,0)
var speed = 300
var maxtime = 2.0

func _ready():
	var timer = Timer.new()
	timer.wait_time = maxtime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")

func on_timeout():
	self.queue_free()

func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)
	if collision_info != null:
		self.queue_free()
