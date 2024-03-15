extends Node2D

func printPath(path : PackedVector2Array):
	for i in range(path.size()):
		var vec = path[i]
		print(vec.x, " ", vec.y)
	pass

func _ready():
	pass

func _process(delta):
	var path = Navigation.request_path(Navigation.MAP, position, Global.player.position)
	#Debug.log(path)
