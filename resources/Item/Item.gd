extends Node2D
class_name Item

@export_group("Item properties")
@export var Sprite: AnimatedSprite2D


func setFlip(flip : bool):
	if flip == true:
		Sprite.flip_v = true
	else:
		Sprite.flip_v = false

func getDirection():
	var direction = Vector2(1, 0) # vector facing right
	direction = direction.rotated(global_rotation)
	return direction


func use():
	pass
