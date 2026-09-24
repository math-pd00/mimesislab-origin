extends Area2D



func _on_Portal03_body_entered(body):
	if body.name == "Player01":
		get_tree().change_scene("res://Game/Scenes/Level04/Level04.tscn")
