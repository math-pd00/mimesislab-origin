extends Area2D

const JUMP_H = -500
var motion : float

func _ready():
	$AnimatedSprite.play("Idle")

func _process(_delta) -> void:
	tween_ctrl()

func tween_ctrl() -> void:
	if Input.is_action_pressed("right"):
		$AnimatedSprite.play("Run")
		$Particulas.emitting = true
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		$AnimatedSprite.play("Run")
		$Particulas.emitting = true
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("Idle")
		$Particulas.emitting = false
	
func _physics_process(delta):
		if Input.is_action_just_pressed("jump"):
			$AnimatedSprite.play("Jump")
			$Particulas.emitting = true
			
func dead():
	$AnimatedSprite.play("Dead HIt")
