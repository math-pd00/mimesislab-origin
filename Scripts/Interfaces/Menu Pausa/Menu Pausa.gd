extends Control

func _process(delta):
	$Menu/Total.text = "Total Score: " + String(Global.puntos + Global.plantas)
	if Input.is_action_just_pressed("Pausa"):
		if get_tree().paused == true:
			get_tree().paused = false
			$Efecto.interpolate_property($Menu, "rect_position", $Menu.rect_position, $Menu.rect_position-Vector2(289,3),0.2,Tween.TRANS_BACK,Tween.EASE_IN)
			$Efecto.start()
		else:
			get_tree().paused = true
			$Efecto.interpolate_property($Menu, "rect_position", $Menu.rect_position, $Menu.rect_position+Vector2(289,3),0.5,Tween.TRANS_BACK,Tween.EASE_IN)
			$Efecto.start()
	
func _on_Continue_pressed():
	if get_tree().paused == true:
		get_tree().get_nodes_in_group("SFX")[0].get_node("Confirm").play()
		get_tree().paused = false
		Global.en_juego = true
		$Efecto.interpolate_property($Menu, "rect_position", $Menu.rect_position, $Menu.rect_position-Vector2(289,3),0.2,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efecto.start()


func _on_Exit_pressed():
	if get_tree().paused == true:
		get_tree().get_nodes_in_group("SFX")[0].get_node("Exit").play()
		get_tree().paused = false
		Global.en_juego = true
		get_tree().change_scene("res://Game/Interfaces/Menu Principal/Menu Principal.tscn")


func _on_Boton_Pausa_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		$Efecto.interpolate_property($Menu, "rect_position", $Menu.rect_position, $Menu.rect_position-Vector2(289,3),0.2,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efecto.start()
	else:
		get_tree().paused = true
		$Efecto.interpolate_property($Menu, "rect_position", $Menu.rect_position, $Menu.rect_position+Vector2(289,3),0.5,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efecto.start()
