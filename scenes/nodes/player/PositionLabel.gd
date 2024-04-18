extends Label


func _process(delta):
	var pos = get_parent().global_position
	text = "x: " + str(pos.x) + " y: " + str(pos.y)
