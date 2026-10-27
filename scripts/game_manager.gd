extends Node

var score = 0
@onready var LabelContador: Label = $"../UI/CanvasLayer/LabelContador"

func add_point():
	score += 1
	LabelContador.text = str(score) + " coins."
