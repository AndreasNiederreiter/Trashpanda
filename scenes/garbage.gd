extends Node2D

@export var speed: int = 2.5

var init_y_pos: float = 10

func _process(delta: float) -> void:
	global_position += Vector2(-speed, 0)


#func _on_area_2d_area_entered(area: Area2D) -> void:
	#get_tree().change_scene_to_file("res://scenes/game_over.tscn")
