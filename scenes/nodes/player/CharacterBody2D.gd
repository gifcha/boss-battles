extends CharacterBody2D
class_name Player

@export var movement_speed: float

func calculateRealMovementSpeed(speed, screen_scale):
	# speed * screen_scale * pixels_per_unit
	speed = speed * screen_scale * Global.UNIT_SIZE
	return speed


func setVelocity(direction, speed):
	var motion = direction
	motion.x = motion.x * speed
	motion.y = motion.y * speed
	velocity = motion # sets body velocity


func _ready():
	# multiply speed by the game window scale setting
	movement_speed = calculateRealMovementSpeed(movement_speed, get_tree().root.content_scale_factor)
	

func _physics_process(delta):

	setVelocity(InputModule.getMovementInputDirection(), movement_speed*delta)
	move_and_slide()
