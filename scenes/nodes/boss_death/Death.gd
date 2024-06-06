extends Enemy

@onready var AM = $actionManager
@onready var animation = $AnimatedSprite2D/AnimationPlayer


func _ready():
	super()
	animation.play("idle")


func tryToPlayAnim(name : String):
	if animation.current_animation == "idle":
		animation.play(name)
	else:
		animation.queue(name)

func _process(delta):
	super(delta) # izsauc process metodi no Enemy klases
	$HealthBar.value = health
	
	
	# get the state from actionManager and execute task depending on that state
	if AM.currentState == AM.state.idle:
		tryToPlayAnim("idle")
	elif AM.currentState == AM.state.move:
		tryToPlayAnim("idle")
		$movement.path = Navigation.request_path(global_position, Global.player.global_position)
	elif AM.currentState == AM.state.attack or AM.currentState == AM.state.ability2 or AM.currentState == AM.state.ability3:
		tryToPlayAnim("attack")
	elif AM.currentState == AM.state.ability1:
		tryToPlayAnim("teleport")
	#await animation.animation_finished
