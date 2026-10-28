extends HSlider

func _ready() -> void:
	min_value = 0
	max_value = 100
	step = 1

	# Recuperar el volumen actual
	value = Music.obtener_volumen()

	# Avisar al Autoload cuando cambie
	value_changed.connect(_al_cambiar_volumen)

func _al_cambiar_volumen(valor: float) -> void:
	Music.cambiar_volumen(valor)
