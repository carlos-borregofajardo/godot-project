extends CanvasLayer

@onready var label_resultado: Label = $LabelResultado
@onready var label_tiempo: Label = $LabelTiempo
@onready var label_contador: Label = $LabelMonedas
@onready var label_mejor_tiempo: Label = $LabelMejorTiempo
@onready var label_mejor_contador: Label = $LabelMejorMonedas
@onready var label_maximo_tiempo: Label = $LabelMaximoTiempo

func _ready() -> void:
	if Datos.contador >= 30:
		label_resultado.text = "¡Victory!"
	else:
		label_resultado.text = "Defeat"
		
	label_tiempo.text = "Time: " + Datos.formatear_tiempo(Datos.tiempo)
	label_contador.text = "Coins: " + str(Datos.contador) + "/30"

	label_mejor_tiempo.text = "Best Complete Time: " + Datos.formatear_tiempo(Datos.mejor_tiempo_30_monedas)
	label_mejor_contador.text = "Best Coins: " + str(Datos.mejor_contador) + "/30"
	label_maximo_tiempo.text = "Max Time: " + Datos.formatear_tiempo(Datos.mayor_tiempo_partida)
