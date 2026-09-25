extends Control

var dialogo = [
	"Era el festival de la Madre Naturaleza en la comunidad...",
	"Todas las personas se alegraban y organizaban la fiesta que se acercaba...",
	"Sin embargo, Jorgito quiso alejarse del pueblo y adentrarse en el bosque en busca de una aventura...",
	"Se encontró con una ardilla, la persiguió y sin darse cuenta se perdió hasta toparse con unos seres fantásticos..."
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
		get_tree().change_scene("res://Game/Scenes/Historia/Transicion02.tscn")


func _on_Tween_tween_completed(object, key):
	fin = true
	forgot = false


func _on_Siguiente_pressed():
	dialogo()
	forgot = true
