extends Control

func _on_Button01_pressed():
		get_tree().get_nodes_in_group("SFX")[0].get_node("Exit").play()
		get_tree().change_scene("res://Game/Interfaces/Menu Principal/Menu Principal.tscn")
		Global.en_juego = true
		get_tree().paused = false
