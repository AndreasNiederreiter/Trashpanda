extends Node2D

@onready var garbage_scene = preload("res://scenes/garbage.tscn")
var Child

func _ready() -> void:
	Child = get_tree().get_root().get_node("/root/Trashcan")

func _process(delta: float) -> void:
	pass
	
func Create_Garbage():
	
	var garbage_init
	
	garbage_init = garbage_scene.instantiate()
	garbage_init.global_position = Vector2(400, -20)
	garbage_init.z_index = 3
	Child.add_child(garbage_init)
