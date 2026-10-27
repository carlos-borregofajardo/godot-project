extends Area2D

@onready var game_manager: Node = get_tree().current_scene.find_child("GameManager", true, false)
@onready var animation_player: AnimationPlayer = $AnimationPlayer


@warning_ignore("unused_parameter")
func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	animation_player.play("pickup")
