extends Node


# Contenedores de la escena principal
@onready var mapa_principal: TileMapLayer = $"../../Escenario/Mapa/Mid"
@onready var fondo: TileMapLayer = $"../../Escenario/Mapa/FondoEscenario"
@onready var padre: Node2D = $"../../Escenario/Mapa/PadreEscenarios"
@onready var plataformas_destino: Node2D = $"../../Escenario/Elementos/Platforms"
@onready var monedas_destino: Node2D = $"../../Escenario/Elementos/Coins"
@onready var interruptores_destino: Node2D = $"../../Escenario/Elementos/Interruptores"
@onready var enemigos_destino: Node2D = $"../../Escenario/Elementos/Enemys"

var Escenarios: Array[String] = [
	"res://scenes/Escenario_1.tscn",
	"res://scenes/Escenario_2.tscn",
	"res://scenes/Escenario_3.tscn",
    "res://scenes/Escenario_4.tscn"
]

var Precarga_Escenarios: Array[PackedScene] = []


func _ready() -> void:
	for ruta in Escenarios:
		var escena := load(ruta) as PackedScene
		if escena:
			Precarga_Escenarios.append(escena)


func copiar_tiles(origen: TileMapLayer, destino: TileMapLayer) -> void:
	if origen == null or destino == null:
		return

	for celda in origen.get_used_cells():
		var posicion_global := origen.to_global(
			origen.map_to_local(celda)
		)
		var celda_destino := destino.local_to_map(
			destino.to_local(posicion_global)
		)

		destino.set_cell(
			celda_destino,
			origen.get_cell_source_id(celda),
			origen.get_cell_atlas_coords(celda),
			origen.get_cell_alternative_tile(celda)
		)


func transferir_objetos(origen: Node2D, destino: Node2D) -> void:
	if origen == null or destino == null:
		return

	for objeto in origen.get_children():
		# Guardar su posición global antes de cambiar de padre.
		var posicion_global := objeto.global_position

		origen.remove_child(objeto)
		destino.add_child(objeto)

		# Mantener su posición en el mundo.
		objeto.global_position = posicion_global


func cargar_escena(posicion: Vector2) -> void:
	if Precarga_Escenarios.is_empty():
		return

	if padre == null or mapa_principal == null or fondo == null:
		push_error("Faltan referencias de la escena principal.")
		return

	var indice := randi_range(0, Precarga_Escenarios.size() - 1)
	var instancia := Precarga_Escenarios[indice].instantiate()

	padre.add_child(instancia)
	instancia.global_position = posicion

	# Mapas de la plantilla.
	var mapa_nuevo: TileMapLayer = instancia.get_node_or_null(
        "Mapa/Escenario"
	)
	var fondo_nuevo: TileMapLayer = instancia.get_node_or_null(
        "Mapa/Fondo"
	)

	# Copiar ambos mapas a sus destinos.
	copiar_tiles(mapa_nuevo, mapa_principal)
	copiar_tiles(fondo_nuevo, fondo)

	# Contenedores de objetos de la plantilla.
	var elementos: Node = instancia.get_node_or_null("Elementos")

	if elementos:
		transferir_objetos(
			elementos.get_node_or_null("Platforms"),
			plataformas_destino
		)
		transferir_objetos(
			elementos.get_node_or_null("Coins"),
			monedas_destino
		)
		transferir_objetos(
			elementos.get_node_or_null("Interruptores"),
			interruptores_destino
		)
		transferir_objetos(
			elementos.get_node_or_null("Enemy"),
			enemigos_destino
		)

	# Destruir la plantilla temporal y sus nodos vacíos.
	instancia.queue_free()
