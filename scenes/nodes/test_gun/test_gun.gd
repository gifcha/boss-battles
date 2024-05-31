extends Gun

@onready var animPlayer = $AnimationPlayer


func _ready():
	super() # runs Gun class ready function


func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		shoot()
		animPlayer.stop(false)
		animPlayer.play("shoot")


	if Input.is_action_just_pressed("reload"):
		reload()
		
