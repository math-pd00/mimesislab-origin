extends Area2D

func _ready():
	$AnimationPlayer.play("Idle")

func _on_Agua_body_entered(body):
	if body.name == "Player01":
			Global.en_juego = false
			get_tree().paused = true
			get_tree().get_nodes_in_group("sfx")[0].get_node("Hurt").play()
			get_tree().get_nodes_in_group("Player")[0].dead() 
