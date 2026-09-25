extends Area2D



func _on_Portal04_body_entered(body):
	if body.name == "Player01":
		get_tree().change_scene("res://Game/Scenes/Historia/Final01.tscn")
