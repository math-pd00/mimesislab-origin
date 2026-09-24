extends Node2D

export var dur_inact: float = 1.2
export var mover_a: Vector2
export var tama_cell: Vector2
export var velocidad: float = 3.0

var seguir: Vector2 = Vector2.ZERO
onready var Plataforma = $Plataformamovil
onready var tween = $Tween

func _ready() -> void:
	_init_tween()
	
func _init_tween() -> void:
	mover_a = mover_a * tama_cell
	var durac = mover_a.length() / velocidad
	tween.interpolate_property(
		self,
		"seguir",
		Vector2.ZERO,
		mover_a,
		durac,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		dur_inact
	)
	tween.interpolate_property(
		self,
		"seguir",
		mover_a,
		Vector2.ZERO,
		durac,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		durac + dur_inact * 2
	)
	tween.start()
		
	
func _physics_process(delta):
	Plataforma.position = seguir
