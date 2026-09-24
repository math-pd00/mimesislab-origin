extends Control

var dialogo = [
	"Más Tarde..."
]
var numero_dialogo = 0
var velocidad_texto = 0.1
var fin = false
var forgot = false

func _ready():
	get_tree().paused = false
	$Texto.percent_visible = 0.5

	
	
func _process(delta):
	if forgot == false:
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
		get_tree().change_scene("res://Game/Scenes/Dialogo/Dialogo01.tscn")

func _on_Tween_tween_completed(object, key):
	fin = true
	forgot = false
