extends Node2D

@export var attackScene : PackedScene
@onready var boss = get_parent()
@onready var attackMarker = $AttackMarker
@onready var unflippedMarkerPos = attackMarker.position

var attack : Node2D


func spawnAttack():
	attack = Global.spawnScene(attackScene, self)
	attack.source = boss
	attack.speed = 0
	attack.damage = boss.damage
	attack.global_position = attackMarker.global_position

func deleteAttack():
	if is_instance_valid(attack):
		attack.queue_free()


func _process(delta):
	if boss.sprite.flip_h == true:
		attackMarker.position.x = -unflippedMarkerPos.x
	else:
		attackMarker.position.x = unflippedMarkerPos.x

