extends Item
class_name Gun

@export_group("Required Nodes")
@export var BarrelMarker: Marker2D
@export var BulletScene: PackedScene

@export_group("Gun Properties")
@export var MaxAmmo: int
@export var MagSize: int
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
var ammo: int
var magAmmo: int




# gun rotation and flipping


func setFlip(flip: bool):
	# overrides item setFlip function to add barrel flip
	super.setFlip(flip)
	if flip == true:
		BarrelMarker.position.y = -originalBarrelPos.y
	else:
		BarrelMarker.position.y = originalBarrelPos.y


func getDirection():
	# overrides getDirection from "Item" class
	var direction = super.getDirection() # calls getDirection from "Item" class
	
	var randomSpray = randf_range(-Spray, Spray)
	randomSpray = deg_to_rad(randomSpray)
	
	direction = direction.rotated(randomSpray)
	return direction



# shooting

func spawnBullet(global_pos, direction):
	var bullet = Global.spawnScene(BulletScene, Global.getRootNode(self))
	bullet.source = player
	bullet.speed = BulletSpeed
	bullet.global_position = global_pos
	bullet.direction = direction
	bullet.sound = ShotSound
	bullet.damage = BulletDamage
	return bullet


func setScreenShake(shakeAmount, direction):
	SignalController.emit_signal("directionalScreenShake", shakeAmount, direction)


func canShoot():
	var flag = true
	if timer.time_left > 0:
		flag = false
	elif magAmmo <= 0:
		flag = false
	return flag


func reload():
	var spent = MagSize - magAmmo
	if spent > 0 and ammo > 0:
		print("reloading")
		var r = min(ammo, spent) # if theres less ammo than spent amount then this uses the avaliable ammo
		ammo -= r
		magAmmo += r

func shoot():
	if canShoot() == false:
		return
	
	magAmmo -= 1
	
	var bullet = spawnBullet(BarrelMarker.global_position, gunDirection)
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
	ammo = MaxAmmo
	magAmmo = MagSize

func _process(delta):
	print(timer.time_left)


func _physics_process(delta):
	gunDirection = getDirection()

