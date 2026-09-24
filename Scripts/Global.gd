extends Node

var en_juego = true
var puntos = 0
var plantas = 0

func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = "x " + String(puntos)

func update_plantas():
	get_tree().get_nodes_in_group("plantas")[0].text = "x " + String(plantas)
