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

@export_group("Sounds")
@export var ShotSound: AudioStream
@export var ReloadSound: AudioStream
@export var EquipSound: AudioStream

var gunDirection = Vector2(0,0)
@onready var player = Global.player # reference to player node
@onready var originalBarrelPos = BarrelMarker.position
var timer: Timer = Timer.new()



# gun rotation and flipping

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



# shooting

func spawnBullet(global_pos, direction):
	var Bullet = Global.spawnScene(BulletScene, Global.getRootNode(self))
	Bullet.global_position = global_pos
	Bullet.direction = direction
	Bullet.sound = ShotSound
	return Bullet


func setScreenShake(shakeAmount, direction):
	SignalController.emit_signal("directionalScreenShake", shakeAmount, direction)


func canShoot():
	var flag = false
	if timer.time_left <= 0:
		flag = true
	return flag


func reload():
	print("reloading")


func shoot():
	if canShoot() == false:
		return
	
	var bullet = spawnBullet(BarrelMarker.global_position, gunDirection)
	bullet.speed = BulletSpeed
	bullet.damage = BulletDamage
	setScreenShake(DirectionalShakeAmount, -gunDirection)
	timer.start(AfterShotDelay)



# timer

func initTimer():
	add_child(timer)
	timer.autostart = true
	timer.one_shot = true
	timer.wait_time = AfterShotDelay
	timer.stop




func _ready():
	initTimer()

func _process(delta):
	print(timer.time_left)


func _physics_process(delta):
	gunDirection = getGunDirection()

