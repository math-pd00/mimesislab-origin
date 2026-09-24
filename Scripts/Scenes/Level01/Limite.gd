extends Area2D

func _on_Limite_body_entered(body):
	if body.name == "Player01":
			Global.en_juego = false
			get_tree().get_nodes_in_group("Player")[0].dead()
