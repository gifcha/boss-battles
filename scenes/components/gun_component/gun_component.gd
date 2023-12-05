extends Node2D


@export_group("Required Nodes")
@export var Sprite: Sprite2D
@export var BarrelMarker: Marker2D
@export var Bullet: BulletNode


@export_group("Gun Properties")
@export var BulletSpeed: float ## Distance in units, the bullet travels in a second (1 unit = 100px) 
@export var BulletDamage: int
@export var ReloadTime: float ## Time it takes to reaload the gun (in seconds) 
@export var AfterShotDelay: float ## Delay (in seconds) AFTER each shot
@export var BeforeShotDelay: float ## Delay (in seconds) BEFORE each shot

func spawnBullet():
	var newBullet = Global.spawnNode(Bullet, Global.getRootNode(self))
	return newBullet

func canShoot():
	return true

func reload():
	print("reloading")

func shoot():
	pass
