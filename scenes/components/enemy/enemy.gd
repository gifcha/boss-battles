extends Node2D
class_name Enemy

@export var speed : int = 100
@export var health : int = 100

@export_group("scripts")
@export var actionManager : GDScript
@export var Attack : GDScript
@export var Move : GDScript
@export var Ability1 : GDScript
@export var Ability2 : GDScript
@export var Ability3 : GDScript

@onready var movement = $movement
@onready var sprite = $AnimatedSprite2D


func take_damage(damage):
	self.health -= damage

func _ready():
	$actionManager.set_script(actionManager)
	$actionManager.set_process(true)
	$actionManager.set_physics_process(true)


func _process(delta):
	if health < 1:
		queue_free()
	
	# flip texture depending on movement direction
	if movement.currentMoveVector.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	

func _physics_process(delta):
	pass
