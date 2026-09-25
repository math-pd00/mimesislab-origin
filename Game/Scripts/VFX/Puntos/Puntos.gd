extends CanvasLayer

func _change_scene():
	if Global.puntos == 10:
		get_tree().change_scene("res://Game/Scenes/Level02/Level02.tscn")
