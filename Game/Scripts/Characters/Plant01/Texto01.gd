extends Control

var dialogo = [
	"Oreopanax ecuadorensis: Especie común y frecuentemente abundante en los remanentes de vegetación andina, en cercas vivas y en vegetación arbustiva a lo largo de ríos. La especie está ampliamente distribuida en la región andina en especial en la parte norte. Ha sido colectada dentro de las reservas ecológicas Cayambe-Coca y Cotacachi-Cayapas; y en áreas próximas al Parque Nacional Sangay y a la Reserva Ecológica El Ángel. Potencialmente podría estar presente en otros parques nacionales que protegen vegetación andina. Es una especie variable en relación a la morfología de sus hojas."
]
var numero_dialogo = 0
var velocidad_texto = .06
var fin = false
var forgot = false

func _ready():
	get_tree().paused = false
	$Texto.percent_visible = 0.5
	dialogo()
	
	
func _process(delta):
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

func _on_Efecto_tween_completed(object, key):
	fin = true
	forgot = false
