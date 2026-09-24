extends Area2D

func _ready():
	$AnimatedSprite2.play("Idle")

func _on_Plant03_body_entered(body):
	if body.name == "Player01" and $Descripcion03.visible == false:
		$Descripcion03.visible = true
	else:
		$Descripcion03.visible == true
		$Descripcion03.visible = false
