extends Node

var itemData = {}
var pattern = []
#var note = {}

var data_file_path = "res://Data/Music-Game track haru.json"

func _ready():
	itemData = load_json_file(data_file_path)
	#print(itemData)
	var sequence = itemData["channels"][0]["sequence"]
	for y in range(sequence.size()):
		var p = sequence[y] - 1
		var offset = 32 * y
	
		var notes = []
		notes = itemData["channels"][0]["patterns"][p]["notes"]
	
		for x in range(notes.size()):
			#print(itemData["channels"][0]["patterns"][0]["notes1"][x]["pitches"])
			#var pitch = null
			var begin = null
			var pitchClass = null
				
			#pitch = notes[x]["pitches"]
			var pitch: float = notes[x]["pitches"][0]
			begin = notes[x]["points"][0]["tick"]	
			
			print(pitch)
			
			var note = {"Pitch" = pitch, "Anfang" = begin + offset}
			pattern.append(note)
		
func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error reading file")
		
	else:
		print("File doesn't exist!")
