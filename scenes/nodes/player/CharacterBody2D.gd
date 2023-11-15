extends CharacterBody2D

@export var speed: float


func getInputDirection():
	var direction = Vector2()
	direction.x = Input.get_axis("action_left", "action_right")
	direction.y = Input.get_axis("action_up", "action_down")
	return direction


func setVelocity(direction, speed):
	var motion = direction
	motion.x = motion.x * speed
	motion.y = motion.y * speed
	velocity = motion # sets body velocity


func doMovement():
	var direction = getInputDirection()
	setVelocity(direction, speed)




func _physics_process(delta):

	doMovement()
	print(velocity)
	move_and_slide()
