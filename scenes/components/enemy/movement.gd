extends Node

@onready var speed : int
@onready var enemy : Node2D
var path = PackedVector2Array()
var currentMoveVector = Vector2()

func isPathSet():
	return len(path) > 1

func move_along_path(path: PackedVector2Array, delta):
	if isPathSet() == false:
		return
	
	currentMoveVector = path[1] - enemy.global_position
	
	enemy.global_position.x = move_toward(enemy.global_position.x, path[1].x, speed*delta)
	enemy.global_position.y = move_toward(enemy.global_position.y, path[1].y, speed*delta)
	if enemy.global_position == path[1]:
		path.remove_at(0)



func _ready():
	enemy = get_parent()
	speed = enemy.speed


func _process(delta):
	if path.size() != 0:
		move_along_path(path, delta)
