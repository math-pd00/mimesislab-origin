extends Control

var dialogo = [
	"Equipo de Desarrollo e Ingenieria:",
	
	
		"Matheo Poma           Enrique Luzuriaga",     
		"Jeremy Moreno         Sebastián Velarde",
	"Equipo de Diseño Gráfico:",
	
	
		"Sarahí Tintín           Gabriel González",    
		"Daniela Torres          Eduardo Arciniega",
	"Tutores del Proyeto:",
	
	
		"Ingeniera en Diseño Gráfico y Magister",
			"Mariana Lozada",
		"Ingeniero de Sistemas y Computaciòn, Master en Redes y Comunicaciones", 
			"Francisco Rodriguez"
]
var numero_dialogo = 0
var velocidad_texto = 0.2
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
		fin = true
		$Texto.bbcode_text = dialogo[numero_dialogo]
		$Texto.percent_visible = 0
		var duracion = velocidad_texto * dialogo[numero_dialogo].length()
		$Efecto.interpolate_property(
			$Texto, "percent_visible",0,2,duracion,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Efecto.start()
	else:
		get_tree().paused = true
		queue_free()
	numero_dialogo += 1
	
	if numero_dialogo > dialogo.size():
		get_tree().change_scene("res://Game/Scenes/Historia/Final02.tscn")


func _on_Tween_tween_completed(object, key):
	fin = true
	forgot = false
