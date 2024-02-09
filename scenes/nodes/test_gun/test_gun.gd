extends Gun

@onready var animPlayer = $AnimationPlayer


func _ready():
	super() # runs GunComponent's ready function


func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		shoot()
		animPlayer.play("shoot")
		print(ammo, " ", magAmmo)


	if Input.is_action_just_pressed("reload"):
		reload()
		print(ammo, " ", magAmmo)
