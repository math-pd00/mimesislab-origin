extends Control

func _process(delta):
	if Global.en_juego == false and self.visible == false:
		self.visible = true
		if $anim.is_playing() == false:
			$anim.play("mover")
			$gameover.play()
			get_tree().paused = true

func _on_Button01_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		Global.en_juego = true
		Global.puntos = 0
		Global.plantas = 0
		get_tree().reload_current_scene()


func _on_anim_animation_finished(anim_name):
	if anim_name == "mover":
		get_tree().paused = true
