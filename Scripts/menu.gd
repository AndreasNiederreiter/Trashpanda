extends Control

# when pressing the menu button "Play" the game will start
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

# when pressing the menu butto "Exit Game" the game will close
func _on_exit_pressed() -> void:
	get_tree().quit()
