extends Node

@export var padre: Node2D

var Escenarios: Array[String] = ["res://scenes/Escenario_1.tscn", "res://scenes/Escenario_2.tscn"]
var Precarga_Escenarios: Array[PackedScene] = []
var instancia

func _ready() -> void:
	for ruta in Escenarios:
		var escenario = load(ruta) as PackedScene
		if escenario:
			Precarga_Escenarios.append(escenario)

func cargar_escena(posicion: Vector2):
	if Precarga_Escenarios.is_empty():
		return
		
	var i = randi_range(0, Precarga_Escenarios.size() - 1)
	instancia = Precarga_Escenarios[i].instantiate()
	padre.add_child.call_deferred(instancia)
	instancia.global_position = posicion
