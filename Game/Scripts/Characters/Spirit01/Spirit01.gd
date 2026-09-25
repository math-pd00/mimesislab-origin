extends Area2D
var motion : float

func _ready():
	$AnimatedSprite.play("Idle")

#func _process(_delta) -> void:
	#tween_ctrl()

#func tween_ctrl() -> void:
	#$Tween.interpolate_property(
		#self,
		#"global_position",
		#global_position,
		#1,
		#Tween.TRANS_BOUNCE,
		#Tween.EASE_OUT
	#)
	#$Tween.start()
	
	#get_tree().call_group("Level", "add_child")
