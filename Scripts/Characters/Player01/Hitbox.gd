extends Area2D

func _on_Hitbox_body_entered(area):
	if area.is_in_group("Traps"):
		$Hurt.play()
		
	if area.is_in_group("Coins"):
		$Coins.play()
