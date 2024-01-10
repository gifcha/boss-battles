extends Node

@onready var player: Player
@onready var animation: AnimationPlayer
@onready var rollTimer = $RollTimer


func setVelocity(direction, speed):
	player.velocity = direction * speed * Global.UNIT_SIZE

func canRun():
	var flag = true
	if player.isRolling == true:
		flag = false
	return flag


func canRoll():
	var flag = true
	if rollTimer.time_left > 0:
		flag = false
	return flag

func roll():
	var direction = InputModule.getMovementInputDirection()
	player.velocity = direction * player.rollSpeed;

func startRollTimer():
	rollTimer.start(player.rollDelay)


func _ready():
	player = get_parent()

func _physics_process(delta):
	if canRun():
		setVelocity(InputModule.getMovementInputDirection(), player.movementSpeed*delta)
	if canRoll() and Input.is_action_just_pressed("right_click"):
		player.animation.play("roll")
	player.move_and_slide()

