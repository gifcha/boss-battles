extends Enemy

@onready var AM = $actionManager
@onready var attackScene : PackedScene

func _ready():
	super()

func spawnAttack(x, y):
	var attack = Global.spawnScene(attackScene, Global.getRootNode(self))
	attack.source = self
	attack.speed = 0
	attack.damage = damage
	attack.global_position = Vector2(x, y)


func _process(delta):
	super(delta) # izsauc process metodi no Enemy klases
	
	# get the state from actionManager and execute task depending on that state
	if AM.currentState == AM.state.idle:
		sprite.play("default")
	elif AM.currentState == AM.state.move:
		$movement.path = Navigation.request_path(global_position, Global.player.global_position)
	elif AM.currentState == AM.state.attack or AM.currentState == AM.state.ability1 or AM.currentState == AM.state.ability2 or AM.currentState == AM.state.ability3:
		$AnimationPlayer.play("attack")
