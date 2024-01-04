extends Node2D

const DEBUG = false
var camera : Camera2D
var speed = 100

var directionalShake: Vector2 = Vector2(0, 0)
var originalOffset: Vector2 = Vector2(0, 0)
var currentShakeAmount: float = 0


func setDirectionalShake(shakeAmount: float, d: Vector2):
	# d = direction
	
	# doesnt set anything if the new shake amount is smaller than current
	if currentShakeAmount > shakeAmount:
		return
	directionalShake = shakeAmount * d.normalized()
	originalOffset = camera.offset




func _ready():
	camera = get_parent()
	
	# connects setDirectionalShake function to directionalScreenShake signal
	SignalController.connect("directionalScreenShake", setDirectionalShake)
	
	

func _process(delta):
	if camera == null:
		print("ScreenShakeController error! camera = null")
		return
	
	if directionalShake != originalOffset:
		camera.offset = camera.offset.move_toward(directionalShake, speed * delta)
		directionalShake = directionalShake.move_toward(originalOffset, speed * delta)
	elif camera.offset != originalOffset:
		camera.offset = camera.offset.move_toward(originalOffset, speed * delta)
	









