extends Node2D
class_name BulletComponent

@export var hitbox: Hitbox

var velocity = Vector2(0, 0)
var speed = 0
var parent: Node2D

func setVelocity(speed, direction):
	velocity = direction * speed * Global.UNIT_SIZE

func hit():
	print("HIT")


func _ready():
	hitbox.hitbox_entered.connect(hit())
	parent = get_parent()



func _physics_process(delta):
	parent.position = position + (velocity * delta)
