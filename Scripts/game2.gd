extends Node2D

var bpm = 130
var start_time = 0.0
var time_begin
var time_delay

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ausgabe funktioniert")# Replace with function body.
	#print(StaticData.pattern[2])
	#time_begin = Time.get_ticks_usec()
	#time_delay = AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency()
	
	#print(StaticData.pattern)
	#print(start_time)
	#print(StaticData.itemData["beatsPerMinute"])
	#bpm = StaticData.itemData["beatsPerMinute"]
	#print(bpm)
	start_time = $playMusic.get_playback_position()
	#print(start_time)
	#print(StaticData.pattern[1]["Anfang"])
	#print(StaticData.note)

	$playMusic.play()


func _on_timer_timeout():
	pass #

var beats_per_second = bpm / 60
var ticks_per_beat = 4

var xLeft = -288
var xRight = 288
var width = xRight - xLeft
var xRef = -243
var ticksInWidth = 24
var pixelSpeed = width / (ticksInWidth * 200)
var trashCan_spawn= false
var x = 0

func getPlayerPositionInTicks(player):
	var pos = player.get_playback_position() + AudioServer.get_time_since_last_mix()
	#pos -= AudioServer.get_output_latency()
	var current_beat = pos * beats_per_second * 48 / 44.1
	var current_tick = current_beat * ticks_per_beat
	return current_tick

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_tick = getPlayerPositionInTicks($playMusic)
	#print("Aktueller Beat:", current_tick, " ", pos)
	#if !$playMusic.playing:
		#print("Song ist vorbei")
	
	#var time = (Time.get_ticks_usec() - time_begin) / 1000000.0
	#time -= time_delay
	#time = max(0, time)
	#print("Time is:", time)
	if ($playMusic.playing && x < StaticData.pattern.size()):
		var note = StaticData.pattern[x]
		var anfang = note["Anfang"]
		var pitch = note["Pitch"]
				
		if (anfang < current_tick + ticksInWidth):
			if (anfang >= ticksInWidth):
				var posInTicks = anfang - current_tick
				Spawner.CreateNoteBall($playMusic, posInTicks, pitch)
				#Trashcan.Create_Garbage()
			x += 1
	
	if (int(current_tick) % 8 == 0):
		if trashCan_spawn == false:
			Trashcan.Create_Garbage()
			trashCan_spawn = true
	
	if (int(current_tick) % 8 != 0):
		trashCan_spawn = false
		print(current_tick)
		print("Funkt")

	#elif !$playMusic.playing:
		#if (StaticData.pattern[x]["Anfang"] == current_tick):
			#if (StaticData.pattern[x]["Pitch"] == 0):
				#Spawner.CreateNote0Ball()
				#x += 1
			#elif (StaticData.pattern[x]["Pitch"] == 4):
				#Spawner.CreateNote4Ball()
				#x += 1
			#elif (StaticData.pattern[x]["Pitch"] == 7):
				#Spawner.CreateNote7Ball()
				#x += 1
	
	#if (current_tick + x == 8):
		#Spawner.CreateNote0Ball()
		#print("Test raus")
		#x += 1 
