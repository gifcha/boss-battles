extends BulletComponent


func _ready():
	$hitbox_module.hitbox_entered.connect(hit)
