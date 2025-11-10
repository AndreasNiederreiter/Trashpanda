extends Control

# restart the game
func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

# exit to menu
func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
@onready var end_score: Label = $"end score"

@onready var Hitscore = preload("res://scenes/hit_notes.tscn")
#score at the end of the game

var score = Hitscore.score

func endScore():
	end_score.text = "your final score: " + str(score)
