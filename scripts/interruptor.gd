extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var controlador: Node = get_node("/root/Game/GameManager/Script Carga Escenarios")

@warning_ignore("unused_parameter")
func _on_area_2d_abajo_body_entered(body: Node2D) -> void:
	animation_player.play("Activación")
	controlador.cargar_escena.call_deferred(Vector2(global_position.x + 24, global_position.y + +40))

@warning_ignore("unused_parameter")
func _on_area_2d_2_arriba_body_entered(body: Node2D) -> void:
	animation_player.play("Activación_Arriba")
	controlador.cargar_escena.call_deferred(Vector2(global_position.x + 24, global_position.y + +40))
