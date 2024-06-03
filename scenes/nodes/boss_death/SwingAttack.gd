extends BulletComponent

var flip_h = false
var flip_v = false

func _ready():
	$hitbox_module.hitbox_entered.connect(hit)

func _process(delta):
	if flip_h == true:
		scale.x = -1
	else:
		scale.x = 1
	if flip_v == true:
		scale.y = -1
	else:
		scale.y = 1
