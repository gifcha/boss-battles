extends BulletComponent
class_name BulletNode

func hit(body):
	# todo fix dealing damage
	# body is characterBody2D not the main Enemy node
	var res = body.take_damage(50)

func _ready():
	$hitbox_module.hitbox_entered.connect(hit)
