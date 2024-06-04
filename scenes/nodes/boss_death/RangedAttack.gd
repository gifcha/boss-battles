extends Node2D

@export var bulletScene : PackedScene
@export var bulletSpeed = 100

@onready var boss = get_parent()

func spawnBullet():
	var bullet = Global.spawnScene(bulletScene, self)
	bullet.source = boss
	bullet.speed = bulletSpeed
	bullet.damage = boss.damage
	bullet.global_position = global_position


