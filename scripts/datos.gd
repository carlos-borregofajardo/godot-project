
extends Node

var tiempo: float = 0.0
var contador: int = 0

# Récords
var mayor_tiempo_partida: float = -1.0
var mejor_tiempo_30_monedas: float = -1.0
var mejor_contador: int = 0

func formatear_tiempo(valor: float) -> String:
	if valor < 0:
		return "--:--:--:---"

	var total_ms = int(valor * 1000.0)
	var horas = total_ms / 3600000
	var minutos = (total_ms / 60000) % 60
	var segundos = (total_ms / 1000) % 60
	var ms = total_ms % 1000

	return "%02d:%02d:%02d:%03d" % [
		horas, minutos, segundos, ms
	]

func terminar_partida() -> void:
	# Guardar el resultado actual
	Datos.tiempo = tiempo

	# Mayor tiempo de partida
	if tiempo > mayor_tiempo_partida:
		mayor_tiempo_partida = tiempo

	# Mejor contador alcanzado
	if contador > mejor_contador:
		mejor_contador = contador

	get_tree().change_scene_to_file("res://scenes/pantalla_final.tscn")

func completar_30_monedas() -> void:
	# Menor tiempo para conseguir las 30 monedas
	if mejor_tiempo_30_monedas < 0 or tiempo < mejor_tiempo_30_monedas:
		mejor_tiempo_30_monedas = tiempo

	# También actualizamos el mayor tiempo de partida
	if tiempo > mayor_tiempo_partida:
		mayor_tiempo_partida = tiempo
	
	# Mejor contador alcanzado
	if contador > mejor_contador:
		mejor_contador = contador

	Datos.contador = contador
	Datos.tiempo = tiempo

	get_tree().change_scene_to_file.call_deferred("res://scenes/pantalla_final.tscn")
