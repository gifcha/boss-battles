extends RayCast2D

var items


# Called when the node enters the scene tree for the first time.
func _ready():
	items = get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	
	
	for item in items:
		if (global_rotation_degrees > 90 || global_rotation_degrees < -90):
			item.setFlip(true)
		else:
			item.setFlip(false)
