extends Node2D

@export var speed: int = 2.5

var init_y_pos: float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position +=  Vector2(-speed, 0)


func _on_note_1_hit_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
	
func Setup(target_x: float):
	global_position = Vector2(200, init_y_pos)
	set_process(true)
