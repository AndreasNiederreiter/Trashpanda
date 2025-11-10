extends Node2D

var PHit1 = false
var PerfectHit = false
var GHit1 = false
var nh1 = false
var Miss = false
var MissHit = false

@onready var IncomingNote= preload("res://scenes/spawner.tscn")
@onready var falling_key = preload("res://scenes/Note0.tscn")

@export var score = 0
@onready var score_lable: Label = $"../Score"

func _ready() -> void:
	$Miss5.visible_characters  = 0
	$Good5.visible_characters  = 0
	$Perfect5.visible_characters  = 0
  
# processes collsion shapes overlaps
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Hit 5") and get_tree().get_root().get_child_count()> 6:
		get_tree().get_root().get_child(4).free()

	if (PerfectHit == true) and Input.is_action_just_pressed("Hit 5"): 
		PHit1 = true
		print("5P")
		score += 3
		print(score)
		$Perfect5.visible_characters = -1
		$TimerP5.start(0.3)
		PerfectHit = false


	
	elif (nh1 == true) and Input.is_action_just_pressed("Hit 5") and (PerfectHit != true):
		GHit1 = true
		print("5G")
		score += 1
		print(score)
		$Good5.visible_characters = -1
		$TimerG5.start(0.3)
		nh1 = false
  


	elif (MissHit == true) and get_tree().get_root().get_child_count()> 6: #and get_tree().get_root().get_child_count()> 6
		Miss = true
		#get_tree().get_root().get_child(4).free()
		$TimerM5.start(0.3)
		$Miss5.visible_characters= -1
		MissHit = false
		#get_tree().get_root().get_child(4).free()

	else:
		PHit1 = false
		GHit1 = false
		Miss == false

		
   #print("MISSED!")
	score_lable.text = "score: " + str(score)
	PHit1 = false
	GHit1 = false
 
func PerfectColl(area: Area2D) -> void:  
	PerfectHit = true
	#print("Perfect In")

func PerfectLeave(area: Area2D) -> void:
	PerfectHit = false
	#print(" Perfect out")
 
#Kollisionstest Gut setzt Variable um für Abfrage
func NoteHit1(area: Area2D) -> void:  #Signal fehlt
	nh1 = true
	#print("5in")
func NoteLeave1(area: Area2D) -> void: #Signal fehlt
	nh1 = false
	#print("out")

func MissIn(area: Area2D) -> void:  
	if (get_tree().get_root().get_child_count()> 6):
		MissHit = true
		#print("MissIn")

func MissOut(area: Area2D) -> void:
	MissHit = false
	#print("Missout")

func Gtimeout1() -> void:
	$Good5.visible_characters  = 0

func Ptimeout1() -> void:
	$Perfect5.visible_characters = 0

func Mtime1() -> void:
	$Miss5.visible_characters = 0
 
