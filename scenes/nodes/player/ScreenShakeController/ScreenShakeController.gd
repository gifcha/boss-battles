extends Node2D

var camera : Camera2D
var dirShakeAmount = 0.0
var ShakeAmount = 0.0


func directionalScreenShake(direction: Vector2, amount: float, delta):
	direction = direction.normalized()
	var shakePos = direction * amount
	

func _ready():
	camera = get_parent()


