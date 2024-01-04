extends Node2D
class_name Hitbox


signal hitbox_entered
signal hitbox_exited

func _on_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	hitbox_entered.emit()

func _on_area_shape_exited(_area_rid, area, _area_shape_index, _local_shape_index):
	hitbox_exited.emit()
