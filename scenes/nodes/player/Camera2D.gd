extends Camera2D


func directionalScreenShake(direction: Vector2, amount: float, speed: float):
	direction = direction.normalized()
	
	# move towards direction
	var originalOffset = offset
	offset = lerp(offset, offset+direction*amount, speed)
	
	# move back
	offset = lerp(offset, originalOffset, speed)


func _ready():
	var PlayerCamera = self
	


func _process(delta):
	pass
