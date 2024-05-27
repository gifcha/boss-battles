extends Node

@export var DEBUG_MODE = true
@export var SYMBOL : String = ">"

func log(message):
	if DEBUG_MODE == true:
		print(SYMBOL, " ", message)


func _ready():
	print("-Debugger ready-")


func _process(delta):
	pass
