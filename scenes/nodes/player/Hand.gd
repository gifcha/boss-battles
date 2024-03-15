extends RayCast2D

var items



func getDirection():
	return target_position.normalized()


func _ready():
	items = get_children()


func _process(delta):
	look_at(get_global_mouse_position())
	
	for item in items:
		if (global_rotation_degrees > 90 || global_rotation_degrees < -90):
			item.setFlip(true)
		else:
			item.setFlip(false)
