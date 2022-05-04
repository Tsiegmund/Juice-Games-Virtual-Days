extends Area2D

func _body_entered(body):
	print("something is near")
	if body.is_in_group("player"):
		get_tree().call_group("enemies", "_on_collision")
