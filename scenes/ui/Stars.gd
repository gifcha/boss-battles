extends Sprite2D

@export var speed : float = 0.00002


func _process(delta):
	rotation_degrees += speed
