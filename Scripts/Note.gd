extends Area2D
@export var speed: int = 2.5
var a =[]
var init_y_pos: float = 50

func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position +=  Vector2(-speed, 0)
	if Input.is_action_just_pressed("Hit 4"):
		pass
		
		#remove_child(get_child(-1))
	#if Input.is_action_just_pressed("Hit 3"):
		#print(get_child_count())

func _on_note_1_hit_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
	
func Setup(target_x: float):
	global_position = Vector2(350, init_y_pos)
	set_process(true)
	#Array3.push_front(self)
	#print(Array3)
	
