extends GunComponent

@onready var animPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	super() # runs GunComponent's ready function


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		shoot()
		animPlayer.play("shoot")
