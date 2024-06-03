extends Node2D
class_name Hitbox

signal hitbox_entered(body)
signal hitbox_exited(body)

@onready var unflippedPos = $CollisionShape2D.position

var flip_h = false
var flip_v = false

func _on_area_entered(body):
	hitbox_entered.emit(body)

func _on_area_exited(body):
	hitbox_exited.emit(body)

func _process(_delta):
	if flip_h == true:
		$CollisionShape2D.position.x = -unflippedPos.x
	else:
		$CollisionShape2D.position.x = unflippedPos.x
	if flip_v == true:
		$CollisionShape2D.position.y = -unflippedPos.y
	else:
		$CollisionShape2D.position.y = unflippedPos.y
