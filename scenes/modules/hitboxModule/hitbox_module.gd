extends Node2D
class_name Hitbox

signal hitbox_entered(body)
signal hitbox_exited(body)


func _on_area_entered(body):
	hitbox_entered.emit(body)

func _on_area_exited(body):
	hitbox_exited.emit(body)
