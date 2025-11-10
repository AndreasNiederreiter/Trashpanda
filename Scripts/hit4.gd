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
	$Miss4.visible_characters  = 0
	$Good4.visible_characters  = 0
	$Perfect4.visible_characters  = 0
  

# processes collsion shapes overlaps
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Hit 4") and get_tree().get_root().get_child_count()> 6:
		get_tree().get_root().get_child(4).free()
 
	if (PerfectHit ==true) and Input.is_action_just_pressed("Hit 4"): 
		PHit1 = true
  #print("PERFECT")
		score += 3
		#print(score)
		$Perfect4.visible_characters = -1
		$TimerP4.start(0.3)
		PerfectHit = false
  
	else:
		PHit1 = false
		
	if (nh1 == true) and Input.is_action_just_pressed("Hit 4") and(PerfectHit != true):
		GHit1 == true
  #print("GOOD")
		score += 1
		#print(score)
		$Good4.visible_characters = -1
		$TimerG4.start(0.3)
		nh1 = false
  
	else:
		GHit1 = false

	if (MissHit ==true):
		Miss== true
   #get_tree().get_root().get_child(4).free()
		$TimerM4.start(0.3)
		$Miss4.visible_characters= -1
		MissHit = false
	else:
		Miss = false
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
func NoteHit1(area: Area2D) -> void:  
	nh1 = true
 #print("in")
func NoteLeave1(area: Area2D) -> void:
	nh1 = false
 #print("out")

func MissIn(area: Area2D) -> void:  
	if (get_tree().get_root().get_child_count()> 6):
		MissHit = true
  #print("Miss")
func MissOut(area: Area2D) -> void:
	MissHit = false
 #print("Missout")

func Gtimeout1() -> void:
	$Good4.visible_characters  = 0
 
func Ptimeout1() -> void:
	$Perfect4.visible_characters = 0

func Mtime1() -> void:
	$Miss4.visible_characters = 0
 
