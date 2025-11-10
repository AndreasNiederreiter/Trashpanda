extends Area2D
@export var speed: int = 3.8

var init_y_pos: float = 50
var bpm = 130
var beats_per_second = bpm / 60
var ticks_per_beat = 4

var lastTick

var xLeft = -288
var xRight = 288
var width = xRight - xLeft
var xRef = -250
var ticksInWidth = 24
var pixelSpeed = width / ticksInWidth
var xOffset = 400
var audioPlayer
var startTick

func getPlayerPositionInTicks(player):
	var pos = player.get_playback_position() + AudioServer.get_time_since_last_mix()
	#pos -= AudioServer.get_output_latency()
	var current_beat = pos * beats_per_second * 48 / 44.1
	var current_tick = current_beat * ticks_per_beat
	return current_tick

func _init():
	set_process(false)

func _process(delta: float) -> void:
	if (audioPlayer):
		var tick = getPlayerPositionInTicks(audioPlayer)
		#var deltaTick = tick - lastTick
		#global_position += Vector2(-deltaTick * pixelSpeed, 0)
		global_position.x = xOffset + (startTick - tick) * pixelSpeed
		lastTick = tick

func _on_note_1_hit_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
	
func Setup(player, posInTicks, y):
	audioPlayer = player

	startTick = getPlayerPositionInTicks(audioPlayer)
	#position.x = xRef + pixelSpeed * posInTicks + 38

	global_position = Vector2(xOffset, init_y_pos + y * 40)
	#lastTick = getPlayerPositionInTicks(audioPlayer)
	set_process(true)
	
