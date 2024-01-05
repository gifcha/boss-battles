extends Node

@onready var player: Player

var state = "idle"

func calculateRealMovementSpeed(speed, screen_scale):
	return speed * screen_scale * Global.UNIT_SIZE


func setVelocity(direction, speed):
	var motion = direction
	motion.x = motion.x * speed
	motion.y = motion.y * speed
	player.velocity = motion

func canRun():
	var flag = true
	# if is rolling false
	return flag

func canRoll():
	var flag = true
	# if is rolling false
	return flag

func roll():
	if canRoll():
		var direction = InputModule.getMovementInputDirection()
		



func _ready():
	player = get_parent()
	
	# multiply speed by the game window scale setting
	player.movement_speed = calculateRealMovementSpeed(player.movement_speed, get_tree().root.content_scale_factor)
	

func _physics_process(delta):
	if canRun():
		setVelocity(InputModule.getMovementInputDirection(), player.movement_speed*delta)
	if canRoll() * Input.is_action_just_pressed("left_click"):
		pass
	player.move_and_slide()

