extends Node2D

func _ready():
	for node in get_children():
		node.hide()
		
func update_healthbar(value):
	$HealthBar.texture_progress = 
	if value < 60:
		$HealthBar.texture_progress = bar_yellow
	if value < 25: 
		$HealthBar.texture_progress = bar_red
	$HealthBar.value = value
	
func _process(delta):
	global_rotation = 0
