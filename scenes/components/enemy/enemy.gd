extends Node2D
class_name Enemy

@export var speed : int = 1000
var path = PackedVector2Array()

func move_along_path(path: PackedVector2Array, delta):
	var vec = path[0] 
	path.remove_at(0)
	var direction = vec.normalized()
	var moveVec = speed*delta*direction
	position += moveVec
	

func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("space"):
		path = Navigation.request_path(position, Global.player.position)
		Debug.log(path)
	if path.size() != 0:
		move_along_path(path, delta)
