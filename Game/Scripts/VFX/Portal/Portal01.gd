extends Area2D



func _on_Portal01_body_entered(body):
	if body.name == "Player01":
		get_tree().change_scene("res://Game/Scenes/Level02/Level02.tscn")
