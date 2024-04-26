extends Node2D
class_name Enemy

@export var speed : int = 100
var path = PackedVector2Array()

func isPathSet():
	return len(path) > 1

func move_along_path(path: PackedVector2Array, delta):
	if isPathSet() == false:
		return
	
	global_position.x = move_toward(global_position.x, path[1].x, speed*delta)
	global_position.y = move_toward(global_position.y, path[1].y, speed*delta)
	if global_position == path[1]:
		path.remove_at(0)


func _ready():
	pass


func _process(delta):
	
	if Input.is_action_pressed("space"):
		path = Navigation.request_path(self.global_position, Global.player.global_position)
	if path.size() != 0:
		move_along_path(path, delta)
