extends Enemy

@onready var AM = $actionManager


func _ready():
	pass


func _process(delta):
	super(_process) # call process inherited from Enemy
	
	# get the state from actionManager and execute task depending on that state
	if AM.currentState == AM.state.idle:
		sprite.play("default")
	elif AM.currentState == AM.state.move:
		$movement.path = Navigation.request_path(global_position, Global.player.global_position)
	elif AM.currentState == AM.state.attack or AM.currentState == AM.state.ability1 or AM.currentState == AM.state.ability2 or AM.currentState == AM.state.ability3:
		$AnimationPlayer.play("attack")