extends Node2D
class_name Enemy

@export var speed : int = 1000
var path = PackedVector2Array()

func move_along_path(path: PackedVector2Array, delta):
	if len(path) < 2:
		return
	
	global_position.x = move_toward(global_position.x, path[1].x, speed*delta)
	global_position.y = move_toward(global_position.y, path[1].y, speed*delta)
	if global_position == path[1]:
		path.remove_at(0)


func drawLine(array : PackedVector2Array):
	pass


func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("space"):
		path = Navigation.request_path(self.global_position, Global.player.global_position)
		Debug.log(path)
	if path.size() != 0:
		move_along_path(path, delta)
