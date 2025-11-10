extends Node2D


@onready var Note0 = preload("res://scenes/Note0.tscn")
@onready var Note4 = preload("res://scenes/Note4.tscn")
@onready var Note7 = preload("res://scenes/Note7.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#var current_tick
	#print(current_tick)
	#if (StaticData.pattern[x]["Anfang"] == current_tick):
		#CreateNoteBall()
		#x += 1



# Called every frame. 'delta' is the elapsed time since the previous frame.





func CreateNoteBall(player, posInTicks, pitch):
	var inst
	var y
	#var startTick
	if (pitch == 31):
		inst = Note0.instantiate()
		y = 4.1
	elif (pitch == 36):
		inst = Note4.instantiate()
		y = 3.1
	elif (pitch == 40):
		inst = Note7.instantiate()
		y = 2.05
	elif (pitch == 43):
		inst = Note0.instantiate()
		y = 1
	elif (pitch == 48):
		inst = Note4.instantiate()
		y = 0

	get_tree().get_root().call_deferred("add_child", inst)
	inst.Setup(player, posInTicks, y)
