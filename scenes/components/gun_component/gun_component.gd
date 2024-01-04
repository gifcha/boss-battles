extends Node2D
class_name GunComponent

@export_group("Required Nodes")
@export var Sprite: AnimatedSprite2D
@export var BarrelMarker: Marker2D
@export var BulletScene: PackedScene

@export_group("Gun Properties")
@export var BulletSpeed: float ## Distance in units, the bullet travels in a second (1 unit = 100px) 
@export var BulletDamage: int
@export var ReloadTime: float
@export var AfterShotDelay: float ## Delay (in seconds) AFTER each shot
@export var BeforeShotDelay: float ## Delay (in seconds) BEFORE each shot
@export var Spray: float
@export var DirectionalShakeAmount: float

var gunDirection = Vector2(0,0)
@onready var player = Global.player # reference to player node
@onready var originalBarrelPos = BarrelMarker.position

func setFlip(f : bool):
	if f == true:
		Sprite.flip_v = true
		BarrelMarker.position.y = -originalBarrelPos.y
	else:
		Sprite.flip_v = false
		BarrelMarker.position.y = originalBarrelPos.y


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


func setScreenShake(shakeAmount, direction):
	SignalController.emit_signal("directionalScreenShake", shakeAmount, direction)


func canShoot():
	return true


func reload():
	print("reloading")


func shoot():
	var bullet = spawnBullet(BarrelMarker.global_position, gunDirection)
	bullet.speed = BulletSpeed
	bullet.damage = BulletDamage
	setScreenShake(DirectionalShakeAmount, -gunDirection)



func _ready():
	pass

func _process(delta):
	pass


func _physics_process(delta):
	gunDirection = getGunDirection()

