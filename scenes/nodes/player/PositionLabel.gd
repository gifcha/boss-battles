extends Label


func _process(delta):
	var pos = get_parent().global_position
	text = "x: " + str(round(pos.x)) + " y: " + str(round(pos.y))
