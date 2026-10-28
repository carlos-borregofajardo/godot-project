extends AudioStreamPlayer2D

func cambiar_volumen(valor: float) -> void:
	var indice_bus := AudioServer.get_bus_index("Master")
	var volumen := valor / 100.0

	if volumen <= 0.0:
		AudioServer.set_bus_mute(indice_bus, true)
	else:
		AudioServer.set_bus_mute(indice_bus, false)
		AudioServer.set_bus_volume_db(indice_bus,linear_to_db(volumen))

func obtener_volumen() -> float:
	var indice_bus := AudioServer.get_bus_index("Master")

	if AudioServer.is_bus_mute(indice_bus):
		return 0.0

	return db_to_linear(AudioServer.get_bus_volume_db(indice_bus)) * 100.0
