
extends TileMapLayer

@onready var player = get_node_or_null("/root/Game/Escenario/Player")

var sprites: Array = []
var rango_actual: int = 0

func _ready():
	if player == null:
		return
	sprites = [
		get_node_or_null("/root/Game/UI/CanvasLayer/Sprite2D"),
		get_node_or_null("/root/Game/UI/CanvasLayer/Sprite2D2"),
		get_node_or_null("/root/Game/UI/CanvasLayer/Sprite2D3")
	]

func _input(event):
	if event.is_action_pressed("Boton_Bomba"):
		if rango_actual >= 3 or player == null:
			return

		var sprite = sprites[rango_actual]
		if is_instance_valid(sprite):
			sprite.queue_free()

		rango_actual += 1

		var celda = local_to_map(to_local(player.global_position))
		borrar_rombo(celda, rango_actual)

func borrar_rombo(celda_central: Vector2i, rango: int):
	for x in range(-rango, rango + 1):
		for y in range(-rango, rango + 1):
			if abs(x) + abs(y) <= rango:
				var celda = celda_central + Vector2i(x, y)
				erase_cell(celda)
