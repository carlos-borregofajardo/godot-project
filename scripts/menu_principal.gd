
extends Node2D

func _ready() -> void:
	var play = get_node_or_null("CanvasLayer/Play")
	var exit = get_node_or_null("CanvasLayer/Exit")

	if play:
		play.pressed.connect(_al_pulsar_jugar)

	if exit:
		exit.pressed.connect(_al_pulsar_salir)


func _al_pulsar_jugar() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _al_pulsar_reintentar() -> void:
	get_tree().reload_current_scene()


func _al_pulsar_salir() -> void:
	get_tree().quit()


func _al_pulsar_opciones() -> void:
	print("Abrir opciones")
