extends Control


# restart the game
func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

# exit to menu
func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
