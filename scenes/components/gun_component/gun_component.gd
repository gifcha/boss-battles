extends Node2D
class_name GunComponent

@export_group("Required Nodes")
@export var Sprite: Sprite2D
@export var BarrelMarker: Marker2D
@export var BulletScene: PackedScene
var gunDirection = Vector2(0,0)


@export_group("Gun Properties")
@export var BulletSpeed: float ## Distance in units, the bullet travels in a second (1 unit = 100px) 
@export var BulletDamage: int
@export var ReloadTime: float
@export var AfterShotDelay: float ## Delay (in seconds) AFTER each shot
@export var BeforeShotDelay: float ## Delay (in seconds) BEFORE each shot
@export var Spray: float



func getGunDirection():
	var temp = BarrelMarker.position
	BarrelMarker.position.y = 0 + randf_range(-Spray, Spray)
	gunDirection = (BarrelMarker.global_position - self.global_position).normalized()
	BarrelMarker.position = temp
	return gunDirection


func spawnBullet(global_pos, direction):
	var newBullet = Global.spawnScene(BulletScene, Global.getRootNode(self))
	newBullet.global_position = global_pos
	newBullet.direction = direction
	return newBullet


func canShoot():
	return true


func reload():
	print("reloading")


func shoot():
	var bullet = spawnBullet(BarrelMarker.global_position, gunDirection)
	bullet.speed = BulletSpeed
	bullet.damage = BulletDamage




func _ready():
	pass


func _physics_process(delta):
	gunDirection = getGunDirection()

