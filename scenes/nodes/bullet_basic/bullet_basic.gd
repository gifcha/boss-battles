extends BulletComponent
class_name BulletNode

func _ready():
	$hitbox_module.hitbox_entered.connect(hit)
