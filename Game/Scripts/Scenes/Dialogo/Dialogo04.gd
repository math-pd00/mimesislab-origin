extends Control

var dialogo = [
	"Seres Fantasticos: No debes temer pequeño, nosotros protegemos la naturaleza de este lugar...",
	"Seres Fantasticos: Somos seres ancestrales del bosque!...",
	"Jorgito: WOW!! Eso es genial...",
	"Seres Fantasticos: SI! que lo es peque...",
	"Seres Fantasticos: Todavía no nos has dicho tu nombre pequeño...",
	"Jorgito: NO! les diré mi nombre, no con extraños...",
	"Seres Fantasticos: Eso está muy bien pequeño, no hace falta que lo hagas...",
	"Seres Fantasticos: Pero por qué estas adentrándote en el bosque tú solo?...",
	"Jorgito: .....",
	"Jorgito: Creo que estoy perdido....",
	"Seres Fantasticos: Tranquilo pequeño te podemos ayudar....",
	"Jorgito: ....",
	"Seres Fantasticos: Qué sucede pequeño?, tienes alguna duda?...",
	"Jorgito: Si la tengo y me intriga bastante, quiero saber acerca de la naturaleza y su propósito en la tierra...",
	"Seres Fantasticos: Hmmm, eres muy interesante pequeño, te contaremos nuestra historia...",
	
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
					get_tree().change_scene("res://Game/Scenes/Dialogo/Transicion01.tscn")
		
func _on_Tween_tween_completed(object, key):
	fin = true
	forgot = false


func _on_Siguiente_pressed():
	dialogo()
	forgot = true
