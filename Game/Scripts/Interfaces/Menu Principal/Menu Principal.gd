extends Node2D
	


func _on_Button01_pressed():
	get_tree().get_nodes_in_group("SFX")[0].get_node("Confirm").play()
	get_tree().paused = false
	get_tree().change_scene("res://Game/Scenes/Historia/Historia01.tscn")



func _on_Button02_pressed():
	get_tree().get_nodes_in_group("SFX")[0].get_node("Exit").play()
	get_tree().quit()
