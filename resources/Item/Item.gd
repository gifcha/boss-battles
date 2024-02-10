extends Node2D
class_name Item

@export_group("Item properties")
@export var Sprite: AnimatedSprite2D


func setFlip(flip : bool):
	if flip == true:
		Sprite.flip_v = true
	else:
		Sprite.flip_v = false

func getItemDirection():
	var direction = Vector2()
	direction = get_parent() # TODO get direction based on the rotation of hand(parent)
	return direction


func use():
	pass
