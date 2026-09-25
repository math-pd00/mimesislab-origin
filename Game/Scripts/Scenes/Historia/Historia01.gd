extends Control

var dialogo = [
	"Jorgito es un niño de 11 años que vive en Nanegalito...",
	"Un día se encuentra con una vieja fotografía de su padre donde se logra ver que tenía mucha naturaleza y muchas flores que le llaman la atención...",
	"En ese momento su padre lo ve y le comienza a relatar una vieja historia de su comunidad..."
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
		get_tree().change_scene("res://Game/Scenes/Historia/Transicion.tscn")


func _on_Tween_tween_completed(object, key):
	fin = true
	forgot = false


func _on_Siguiente_pressed():
	dialogo()
	forgot = true

func _on_Saltar_pressed():
	get_tree().change_scene("res://Game/Scenes/Level01/Level01.tscn")
