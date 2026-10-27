
extends Node2D

@export var ancho_mapa: float = 1632.0

@onready var mapa_a: TileMapLayer = $BackgroundCieloA
@onready var mapa_b: TileMapLayer = $BackgroundCieloB
@onready var player: CharacterBody2D = $"../../Player"


func _process(_delta: float) -> void:
	# Si el jugador supera el final del mapa A,
	# coloca A detrás de B.
	if player.global_position.x >= mapa_a.global_position.x + ancho_mapa:
		mapa_a.global_position.x = mapa_b.global_position.x + ancho_mapa

	# Si el jugador supera el final del mapa B,
	# coloca B detrás de A.
	if player.global_position.x >= mapa_b.global_position.x + ancho_mapa:
		mapa_b.global_position.x = mapa_a.global_position.x + ancho_mapa
