extends Node2D

var PHit1 = false
var PerfectHit = false
var GHit1 = false
var nh1 = false
var Miss = false
var MissHit = false
#var timer_over = false
@onready var IncomingNote= preload("res://scenes/spawner.tscn")
@onready var falling_key = preload("res://scenes/Note0.tscn")

@export var score = 0
@onready var score_lable: Label = $"../Score"

func _ready() -> void:
	$Good2.visible_characters  = 0
	$Miss2.visible_characters  = 0
	$Perfect2.visible_characters  = 0
  

# processes collsion shapes overlaps
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Hit 2") and get_tree().get_root().get_child_count()> 6:
		get_tree().get_root().get_child(4).free()

	if (PerfectHit == true) and Input.is_action_just_pressed("Hit 2"): 
		PHit1 = true
		#print("PERFECT")
		score += 3
		#print(score)
		$Perfect2.visible_characters = -1
		$TimerP2.start(0.3)
		PerfectHit = false #Neuerung
 
	elif (nh1 == true) and Input.is_action_just_pressed("Hit 2") and(PerfectHit !=true):
		GHit1 = true
		#print("GOOD")
		score += 1
		#print(score)
		$Good2.visible_characters = -1
		$TimerG2.start(0.2)
		nh1 = false #Neuerung
		
	elif (MissHit == true) and get_tree().get_root().get_child_count()> 6:
		Miss = true
		#get_tree().get_root().get_child(4).free() ##Mal rausgenommen. Weiß selber nicht warum??
		$TimerM2.start(0.2)
		$Miss2.visible_characters= -1
		MissHit = false #Neuerung
	
	else:
		PHit1 = false
		GHit1 = false
		Miss = false
   #print("MISSED!")
	score_lable.text = "score: " + str(score)
	PHit1 = false #Neuerung
	GHit1 = false #Neuerung

func PerfectColl(area: Area2D) -> void:  
	PerfectHit = true
	#print("2P")
func PerfectLeave(area: Area2D) -> void:
	PerfectHit = false
# print(" Perfect out")
 
#Kollisionstest Gut setzt Variable um für Abfrage
func NoteHit1(area: Area2D) -> void:  
	nh1 = true
	#print("2in")
func NoteLeave1(area: Area2D) -> void:
	nh1 = false
 #print("o")

func MissIn(area: Area2D) -> void:  
	if (get_tree().get_root().get_child_count()> 6):
		MissHit = true
		#print("M2")

func MissOut(area: Area2D) -> void:
	MissHit = false
 #print("Missout")

func Gtimeout1() -> void:
	$Good2.visible_characters  = 0
 
func Ptimeout1() -> void:
	$Perfect2.visible_characters = 0

func Mtime1() -> void:
	$Miss2.visible_characters = 0
 
