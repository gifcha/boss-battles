extends RayCast2D

var Guns


# Called when the node enters the scene tree for the first time.
func _ready():
	Guns = get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	
	
	for Gun in Guns:
		if (global_rotation_degrees > 90 || global_rotation_degrees < -90):
			Gun.setFlip(true)
		else:
			Gun.setFlip(false)
