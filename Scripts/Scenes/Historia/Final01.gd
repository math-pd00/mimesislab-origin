extends Control

var dialogo = [
	"Jorgito pudo regresar con su familia y vecinos y les contó todo lo que había transcurrido en su ausencia...",
	"Que conoció a estos seres fantásticos llenos de vida y que daban todos los días grandes regalos...",
	"Esto llamó la atención de la comunidad, quiénes no creían sus palabras, entonces estos fueron al bosque a investigar...",
	"La comunidad se sorprendió ya que se encontraron con los seres fantásticos y creyeron en todo lo que Jorgito les relato en sus historias...",
	"Por lo que la comunidad decidió protegerlos, cuidarlos y aprender de ellos por siempre, incluso con las amenazas a su alrededor..."
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
		get_tree().change_scene("res://Game/Scenes/Historia/Credito01.tscn")


func _on_Tween_tween_completed(object, key):
	fin = true
	forgot = false


func _on_Siguiente_pressed():
	dialogo()
	forgot = true
