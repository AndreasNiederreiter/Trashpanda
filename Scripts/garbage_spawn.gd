extends Node2D
@onready var IncomingTrash = preload("res://scenes/trashcan.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Hit 3"):
		pass#Garbage()


func Garbage():
	var fk_inst = IncomingTrash.instantiate()
	get_tree().get_root().call_deferred("add_child", fk_inst)
#	fk_inst.Setup(0)
