extends Node2D

var camera: Camera2D

@export var maxOffsetRadius: float = 1 # in units
@export var speed = 1.0
@export var offsetScale = 2 # divide the mouseVector by this scale

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_global_mouse_position()
	var mouseVector = mousePos - global_position
	var direction = mouseVector.normalized()
	
	var aimOffset = mouseVector/offsetScale
	if aimOffset.length() < maxOffsetRadius * Global.UNIT_SIZE:
		camera.position = aimOffset
	else:
		camera.position = direction * maxOffsetRadius * Global.UNIT_SIZE
