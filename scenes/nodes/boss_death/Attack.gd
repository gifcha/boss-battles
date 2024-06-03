extends Node2D

@export var attackScene1 : PackedScene
@export var attackScene2 : PackedScene
@onready var boss = get_parent()
@onready var attackMarker = $AttackMarker
@onready var unflippedMarkerPos = attackMarker.position

var attack : Node2D


func spawnAttack1():
	attack = Global.spawnScene(attackScene1, self)
	attack.source = boss
	attack.speed = 0
	attack.damage = boss.damage
	attack.global_position = attackMarker.global_position

func spawnAttack2():
	attack = Global.spawnScene(attackScene2, self)
	attack.source = boss
	attack.speed = 0
	attack.damage = boss.damage
	attack.global_position = attackMarker.global_position

func deleteAttack():
	# ja attack elements vel pastav, izdzest
	if is_instance_valid(attack):
		attack.queue_free()


func _process(delta):
	if boss.sprite.flip_h == true:
		attackMarker.position.x = -unflippedMarkerPos.x
		if is_instance_valid(attack):
			attack.flip_h = true
	else:
		attackMarker.position.x = unflippedMarkerPos.x
		if is_instance_valid(attack):
			attack.flip_h = false

