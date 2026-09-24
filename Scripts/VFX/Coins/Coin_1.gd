extends Area2D

export (int) var plantas

	
func _on_Coin_body_entered(body):
	if body.name == "Player01":
		$AnimatedSprite.play("Miss")
		Global.plantas += plantas
		get_tree().get_nodes_in_group("sfx")[0].get_node("Plant").play()
		Global.update_plantas()
		yield($AnimatedSprite,"animation_finished")
		self.queue_free()
