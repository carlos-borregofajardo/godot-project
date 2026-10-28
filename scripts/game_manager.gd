extends Node

var score = 0
@onready var LabelContador: Label = $"../UI/CanvasLayer/LabelContador"

func add_point():
	score += 1
	Datos.contador = score
	LabelContador.text = str(score) + "/30 coins."
	if score == 30:
		Datos.terminar_partida()
