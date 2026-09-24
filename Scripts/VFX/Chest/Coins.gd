extends Area2D

export (int) var puntos

func _ready():
	$AnimationPlayer.play("Idle")
	
	
func _on_Coins_body_entered(body):
	if body.name == "Player01" and $Sprite.visible == false:
		$Sprite.visible = true
		Global.puntos += puntos
		get_tree().get_nodes_in_group("sfx")[0].get_node("Coins").play()
		Global.update_puntos()
	else:
		$Sprite.visible == true
		#self.queue_free()
		$Sprite.visible = false
