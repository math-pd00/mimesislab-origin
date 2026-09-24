extends Area2D

func _ready():
	$AnimatedSprite2.play("Idle")
	
	
func _on_Plant02_body_entered(body):
	if body.name == "Player01" and $Descripcion02.visible == false:
		$Descripcion02.visible = true
	else:
		$Descripcion02.visible == true
		$Descripcion02.visible = false
