extends Node2D

#@onready var IncomingNote= preload("res://scenes/spawner.tscn")
#@onready var falling_key = preload("res://scenes/Note0.tscn")
@onready var score_lable: Label = $Score
@export var score = 0

var Perfect_1 = false
var Good_1 = false

var Perfect_2 = false
var Good_2 = false

var Perfect_3 = false
var Good_3 = false

var Perfect_4 = false
var Good_4 = false

var Perfect_5 = false
var Good_5 = false


func _ready() -> void:
	$Perfect.visible_characters = 0
	$Good.visible_characters = 0
	$Miss.visible_characters = 0
	
	
	
func _process(delta: float) -> void:
	
	if (get_tree().get_root().get_child_count() > 5):
		
		if Input.is_action_just_pressed("Hit 1"):
			
			if Perfect_1 == true:
				get_tree().get_root().get_child(5).free()
				Perfect_1 = false
				Good_1 = false
				score += 3
				$Perfect.visible_characters = -1
				$TimerPerfect.start(0.2)
			
			elif Good_1 == true:
				get_tree().get_root().get_child(5).free()
				Good_1 = false
				Perfect_1 = false
				score += 1
				$Good.visible_characters = -1
				$TimerGood.start(0.2)
			
			else:
				get_tree().get_root().get_child(5).free()
				$Miss.visible_characters = -1
				$TimerMiss.start(0.2)
		
		if Input.is_action_just_pressed("Hit 2"):
			
			if Perfect_2 == true:
				get_tree().get_root().get_child(5).free()
				Perfect_2 = false
				Good_2 = false
				score += 3
				$Perfect.visible_characters = -1
				$TimerPerfect.start(0.2)
			
			elif Good_2 == true:
				get_tree().get_root().get_child(5).free()
				Good_2 = false
				Perfect_2 = false
				score += 1
				$Good.visible_characters = -1
				$TimerGood.start(0.2)
			
			else:
				get_tree().get_root().get_child(5).free()
				$Miss.visible_characters = -1
				$TimerMiss.start(0.2)
		
		if Input.is_action_just_pressed("Hit 3"):
			
			if Perfect_3 == true:
				get_tree().get_root().get_child(5).free()
				Perfect_3 = false
				Good_3 = false
				score += 3
				$Perfect.visible_characters = -1
				$TimerPerfect.start(0.2)
			
			elif Good_3 == true:
				get_tree().get_root().get_child(5).free()
				Good_3 = false
				Perfect_3 = false
				score += 1
				$Good.visible_characters = -1
				$TimerGood.start(0.2)
			
			else:
				get_tree().get_root().get_child(5).free()
				$Miss.visible_characters = -1
				$TimerMiss.start(0.2)
		
		if Input.is_action_just_pressed("Hit 4"):
			
			if Perfect_4 == true:
				get_tree().get_root().get_child(5).free()
				Perfect_4 = false
				Good_4 = false
				score += 3
				$Perfect.visible_characters = -1
				$TimerPerfect.start(0.2)
			
			elif Good_4 == true:
				get_tree().get_root().get_child(5).free()
				Good_4 = false
				Perfect_4 = false
				score += 1
				$Good.visible_characters = -1
				$TimerGood.start(0.2)
			
			else:
				get_tree().get_root().get_child(5).free()
				$Miss.visible_characters = -1
				$TimerMiss.start(0.2)
		
		if Input.is_action_just_pressed("Hit 5"):
			
			if Perfect_5 == true:
				get_tree().get_root().get_child(5).free()
				Perfect_5 = false
				Good_5 = false
				score += 3
				$Perfect.visible_characters = -1
				$TimerPerfect.start(0.2)
			
			elif Good_5 == true:
				get_tree().get_root().get_child(5).free()
				Good_5 = false
				Perfect_5 = false
				score += 1
				$Good.visible_characters = -1
				$TimerGood.start(0.2)
			
			else:
				get_tree().get_root().get_child(5).free()
				$Miss.visible_characters = -1
				$TimerMiss.start(0.2)
	
	score_lable.text = "score: " + str(score)



func in_PerfectHit_1 (area: Area2D) -> void:
	Perfect_1 = true
	Good_1 = false

func out_PerfectHit_1 (area: Area2D) -> void:
	Perfect_1 = false
	Good_1 = true

func in_GoodHit_1 (area: Area2D) -> void:
	Good_1 = true

func out_GoodHit_1 (area: Area2D) -> void:
	Good_1 = false



func in_PerfectHit_2 (area: Area2D) -> void:
	Perfect_2 = true
	Good_2 = false

func out_PerfectHit_2 (area: Area2D) -> void:
	Perfect_2 = false
	Good_2 = true

func in_GoodHit_2 (area: Area2D) -> void:
	Good_2 = true

func out_GoodHit_2 (area: Area2D) -> void:
	Good_2 = false



func in_PerfectHit_3 (area: Area2D) -> void:
	Perfect_3 = true
	Good_3 = false

func out_PerfectHit_3 (area: Area2D) -> void:
	Perfect_3 = false
	Good_3 = true

func in_GoodHit_3 (area: Area2D) -> void:
	Good_3 = true

func out_GoodHit_3 (area: Area2D) -> void:
	Good_3 = false



func in_PerfectHit_4 (area: Area2D) -> void:
	Perfect_4 = true
	Good_4 = false

func out_PerfectHit_4 (area: Area2D) -> void:
	Perfect_4 = false
	Good_4 = true

func in_GoodHit_4 (area: Area2D) -> void:
	Good_4 = true

func out_GoodHit_4 (area: Area2D) -> void:
	Good_4 = false



func in_PerfectHit_5 (area: Area2D) -> void:
	Perfect_5 = true
	Good_5 = false

func out_PerfectHit_5 (area: Area2D) -> void:
	Perfect_5 = false
	Good_5 = true

func in_GoodHit_5 (area: Area2D) -> void:
	Good_5 = true

func out_GoodHit_5 (area: Area2D) -> void:
	Good_5 = false




func PerfectLable_Timeout() -> void:
	$Perfect.visible_characters = 0

func GoodLable_Timeout() -> void:
	$Good.visible_characters = 0

func MissLable_Timeout() -> void:
	$Miss.visible_characters = 0


func at_end (area: Area2D) -> void:
	if get_tree().get_root().get_child_count() > 5:
		$Miss.visible_characters = -1
		$TimerMiss.start(0.2)
		get_tree().get_root().get_child(5).free()
