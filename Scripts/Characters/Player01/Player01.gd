extends KinematicBody2D

const JUMP_FORCE = 400
const MOVE_SPEED = 180
const GRAVITY = 40
const MAX_SPEED = 1550
const FRICTION_AIR = 0.95
const FRICTION_GROUND = 0.85
#const CHAIN_PULL = 95
const BOUNCING_JUMP = 720
const CAST_WALL = 5

var velocity = Vector2(0,0)
var chain_velocity := Vector2(0,0)
var can_jump = false
var motion = Vector2()
var can_move : bool
onready var anim_play : AnimatedSprite = $AnimatedSprite
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.pressed:
			# We clicked the mouse -> shoot()
			#$Chain.shoot(event.position - get_viewport().size * 0.5)
		#else:
			# We released the mouse -> release()
			#$Chain.release()

func _physics_process(_delta: float) -> void:
	var walk = (Input.get_action_strength("right") - Input.get_action_strength("left")) * MOVE_SPEED
	
	if can_move:
		if motion.x == 1:
			$RayCast/Wall.cast_to.y = CAST_WALL
			$AnimatedSprite.flip_h = false
		elif motion.x == -1:
			$RayCast/Wall.cast_to.y = -CAST_WALL
			$AnimatedSprite.flip_h = true
			
	if Input.is_action_just_pressed("Restart"):
			get_tree().reload_current_scene()
			
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
		
	velocity.y += GRAVITY

	#if $Chain.hooked:
		#to_local($Chain.tip).normalized()
		#chain_velocity = to_local($Chain.tip).normalized() * CHAIN_PULL
		#if chain_velocity.y > 0:
			#chain_velocity.y *= 0.55
		#else:
			#chain_velocity.y *= 1.65
		#if sign(chain_velocity.x) != sign(walk):
			#chain_velocity.x *= 0.7
	#else:
		#chain_velocity = Vector2(0,0)
	#velocity += chain_velocity

	velocity.x += walk
	move_and_slide(velocity, Vector2.UP)
	velocity.x -= walk

	velocity.y = clamp(velocity.y, -MAX_SPEED, MAX_SPEED)
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	var grounded = is_on_floor()
	if grounded:
		velocity.x *= FRICTION_GROUND
		can_jump = true
		if velocity.y >= 5:
			velocity.y = 5
	elif is_on_ceiling() and velocity.y <= -5:
		velocity.y = -5

	if !grounded:
		velocity.x *= FRICTION_AIR
		$AnimatedSprite.play("Jump")
		$Particulas.emitting = true
		if velocity.y > 0:
			velocity.y *= FRICTION_AIR
			$AnimatedSprite.play("Fall")
			$Particulas.emitting = false
		if $RayCast/Wall.is_colliding():
			can_move = false
			
			var col = $RayCast/Wall.get_collider()
			
			if col.is_in_group("Wall") and Input.is_action_just_pressed("jump"):
				can_move = false
				motion.y += JUMP_FORCE
				
				if $AnimatedSprite.flip_h:
					motion.x += BOUNCING_JUMP
					$AnimatedSprite.flip_h = false
				else:
					motion.x -= BOUNCING_JUMP
					$AnimatedSprite.flip_h = true

	if Input.is_action_just_pressed("jump"):
		if grounded:
			get_tree().get_nodes_in_group("SfX")[0].get_node("Jump").play()
			velocity.y = -JUMP_FORCE
		elif can_jump:
			get_tree().get_nodes_in_group("SfX")[0].get_node("Jump").play()
			can_jump = false
			velocity.y = -JUMP_FORCE
		
	
func dead():
	set_physics_process(false)
	anim_play.play("Dead HIt")
	yield(anim_play,"animation_finished")
	get_tree().get_nodes_in_group("over")[0]
