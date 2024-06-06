extends AudioStreamPlayer

var MaxPolphony = 32


func _ready():
	stream = AudioStreamPolyphonic.new()
	stream.polyphony = MaxPolphony

func playSound(s : AudioStream):
	if playing == false:
		play()
	
	var playback = get_stream_playback()
	playback.play_stream(s)
