extends Node2D
class_name Hitbox


signal hitbox_entered
signal hitbox_exited

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	hitbox_entered.emit()

func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	hitbox_exited.emit()
