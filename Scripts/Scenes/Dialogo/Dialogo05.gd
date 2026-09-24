extends Control

var dialogo = [
	"Seres Fantásticos: En conclusión el propósito de la naturaleza es poder brindarles a todos los recursos necesarios para de esa forma dar prosperidad...",
	"Jorgito: Entonces lo que me dicen es que todo lo que nos rodea está vivo? Y que sobre todo que cada ser vivo es importante?...",
	"Seres Fantásticos: Eso es correcto pequeño y cada ser vivo tiene un misión concreta que debe atender...",
	"Jorgito: Me pregunto cuál será mi misión?...",
	"Jorgito: .....",
	"Seres Fantásticos: Humm podrías ser...",
	"Jorgito: Qué sucede? De qué hablan?...",
	"Seres Fantásticos: Eres el indicado para cumplir con una misión muy importante para nosotros...",
	"Jorgito: Y por qué haría eso?...",
	"Seres Fantásticos: Por qué no fuimos nosotros los que te escogimos para esta misión, fue la misma naturaleza quién te escogió...",
	"Jorgito: Y cuál sería esa misión?...",
	"Seres Fantásticos: La mision es que tienes que encontrar toda la flora disponible y conservarla para transmitir ese conocimiento a tú comunidad...",
	"Jorgito: Muy bien lo haré, protegeré la flora y compartiré este conocimiento con todos..."
	
	
]
var numero_dialogo = 0
var velocidad_texto = .06
var fin = false
var forgot = false

func _ready():
	get_tree().paused = false
	$Texto.percent_visible = 0.5
	$Siguiente/AnimationPlayer.play("fin")
	dialogo()
	$Player/AnimatedSprite.play("Idle")
	$Player/AnimatedSprite2.play("Idle")
	$Player/AnimatedSprite3.play("Idle")
	$Player/AnimatedSprite4.play("Idle")
	$Player2/AnimatedSprite.play("Idle")
	
func _process(delta):
	$Siguiente.visible = fin
	if forgot == false:
		if Input.is_action_just_pressed("seguir"):
			dialogo()
			forgot = true
			
func dialogo():
	if numero_dialogo < dialogo.size():
		fin = false
		$Texto.bbcode_text = dialogo[numero_dialogo]
		$Texto.percent_visible = 0
		var duracion = velocidad_texto * dialogo[numero_dialogo].length()
		$Efecto.interpolate_property(
			$Texto, "percent_visible",0,1,duracion,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Efecto.start()
	else:
		get_tree().paused = false
		queue_free()
	numero_dialogo += 1
	
	if numero_dialogo > dialogo.size():
		get_tree().change_scene("res://Game/Scenes/Dialogo/Transicion02.tscn")
		
func _on_Tween_tween_completed(object, key):
	fin = true
	forgot = false


func _on_Siguiente_pressed():
	dialogo()
	forgot = true
