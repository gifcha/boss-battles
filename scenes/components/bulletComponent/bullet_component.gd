extends Node2D
class_name BulletComponent

@export var hitbox: Hitbox
@export var AudioPlayer: AudioStreamPlayer2D

@onready var speed: int
@onready var direction: Vector2
@onready var damage: int

var parent: Node2D
static var sound: AudioStream

func hit():
	print("HIT")

func playSound(sound: AudioStream):
	AudioPlayer.stream = sound
	print("Set bullet sound")
	AudioPlayer.play(0)
	print("Played bullet sound")


func _ready():
	hitbox.hitbox_entered.connect(hit)
	parent = get_parent()
	playSound(sound)

func _physics_process(delta):
	var velocity = direction * speed * Global.UNIT_SIZE * delta
	position += velocity
