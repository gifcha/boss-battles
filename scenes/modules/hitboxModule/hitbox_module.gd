extends Node2D
class_name Hitbox


signal hitbox_entered(body)
signal hitbox_exited(body)

func _on_body_entered(body):
	hitbox_entered.emit(body)


func _on_body_exited(body):
	hitbox_entered.emit(body)


func _on_area_entered(area):
	hitbox_entered.emit(area)


func _on_area_exited(area):
	hitbox_exited.emit(area)
