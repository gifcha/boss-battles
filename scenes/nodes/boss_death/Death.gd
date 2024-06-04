extends Enemy

@onready var AM = $actionManager
@onready var animation = $AnimatedSprite2D/AnimationPlayer


func _ready():
	super()

var lastState = 0
func _process(delta):
	super(delta) # izsauc process metodi no Enemy klases
	$HealthBar.value = health
	
	if lastState != AM.currentState:
		animation.play("RESET")
	
	# get the state from actionManager and execute task depending on that state
	if AM.currentState == AM.state.idle:
		animation.play("idle")
	elif AM.currentState == AM.state.move:
		animation.play("idle")
		$movement.path = Navigation.request_path(global_position, Global.player.global_position)
	elif AM.currentState == AM.state.attack or AM.currentState == AM.state.ability2 or AM.currentState == AM.state.ability3:
		animation.play("attack")
	elif AM.currentState == AM.state.ability1:
		animation.play("teleport")
	
	lastState = AM.currentState
