extends Node2D
class_name Bullet

@export var hitbox : Hitbox

var velocity = Vector2(0, 0)

func setVelocity(speed, direction):
	velocity = direction * speed * GlobalVars.UNIT_SIZE

func hit():
	print("HIT")


func _ready():
	hitbox.hitbox_entered.connect(hit())



func _physics_process(delta):
	position = position + (velocity * delta)
