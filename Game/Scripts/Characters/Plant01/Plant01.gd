extends Area2D


func _ready():
	$AnimatedSprite.play("Idle")
	
	
func _on_Plant01_body_entered(body):
	if body.name == "Player01" and $Descripcion01.visible == false:
		$Descripcion01.visible = true
	else:
		$Descripcion01.visible == true
		$Descripcion01.visible = false
