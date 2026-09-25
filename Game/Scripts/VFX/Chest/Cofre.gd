extends Area2D


func _on_Cofre_body_entered(body):
	if body.name == "Player01":
		$Chest.play("Chest")
		
