extends Node2D
class_name BulletComponent

@export var hitbox: Hitbox

@onready var speed: int
@onready var direction: Vector2
@onready var velocity: Vector2
@onready var damage: int

var parent: Node2D

func setVelocity(speed, direction):
	velocity = direction * speed

func hit():
	print("HIT")


func _ready():
	hitbox.hitbox_entered.connect(hit)
	parent = get_parent()
	

func _physics_process(delta):
	position += direction * speed
