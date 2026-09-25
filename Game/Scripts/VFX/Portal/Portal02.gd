extends Area2D


func _on_Portal02_body_entered(body):
	if body.name == "Player01":
		get_tree().change_scene("res://Game/Scenes/Level03/Level03.tscn")
