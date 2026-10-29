extends Button
func _on_button_mouse_entered():
	$AnimationPlayer.play("Hover")

func _on_button_mouse_exited():
	$AnimationPlayer.play("Unhover")
