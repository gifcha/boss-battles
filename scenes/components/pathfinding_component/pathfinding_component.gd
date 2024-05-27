extends Node2D

func _ready():
	pass

func _process(delta):
	var path = Navigation.request_path(position, Global.player.position)
