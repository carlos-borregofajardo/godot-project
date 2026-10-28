extends Node

var tiempo: float = 0.0
@onready var label_tiempo: Label = $"."

func _ready() -> void:
	Datos.tiempo = 0.0
	Datos.contador = 0
	
func _process(delta: float) -> void:
	tiempo += delta
	Datos.tiempo = tiempo

	label_tiempo.text = Datos.formatear_tiempo(tiempo)
