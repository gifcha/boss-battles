extends Node2D
class_name BulletComponent

@export var hitbox: Hitbox
@export var AudioPlayer: AudioStreamPlayer2D

@onready var speed: int
@onready var direction: Vector2
@onready var damage: int

var source: Node2D
var parent: Node2D
static var sound: AudioStream


# override this function when making new bullet
func hit(body):
	if body.owner.has_method("take_damage") and body.owner != source:
		body.owner.take_damage(damage)
		queue_free()

func playSound(sound: AudioStream):
	AudioPlayer.stream = sound
	AudioPlayer.play(0)


func _ready():
	hitbox.hitbox_entered.connect(hit.bind())
	parent = get_parent()
	playSound(sound)

func _physics_process(delta):
	var velocity = direction * speed * Global.UNIT_SIZE * delta
	position += velocity
