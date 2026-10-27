extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var controlador: Node = get_node("/root/Game/GameManager/Script Carga Escenarios")

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body: Node2D) -> void:
	animation_player.play("Activación")
	controlador.cargar_escena(Vector2(global_position.x + 24, global_position.y + +40))
