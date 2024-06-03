extends Node2D
class_name Enemy

@export var speed : int = 100
@export var health : int = 100
@export var damage : int = 1

@export_group("scripts")
@export var actionManager : GDScript
@export var Attack : GDScript
@export var Move : GDScript
@export var Ability1 : GDScript
@export var Ability2 : GDScript
@export var Ability3 : GDScript

@onready var movement = $movement
@onready var sprite = $AnimatedSprite2D
@onready var unflippedSpritePos = sprite.position


func take_damage(damage):
	self.health -= damage

func _ready():
	$actionManager.set_script(actionManager)
	$actionManager.set_process(true)
	$actionManager.set_physics_process(true)


func _process(delta):
	global_position = $CharacterBody2D.global_position
	if health < 1:
		queue_free()
	
	# apgriezt sprite un hitbox atkarībā no kustības
	if movement.currentMoveVector.x < 0:
		sprite.flip_h = true
		$CharacterBody2D/hitbox_module.scale.x = -1
		sprite.position.x = -unflippedSpritePos.x
	else:
		sprite.flip_h = false
		$CharacterBody2D/hitbox_module.scale.x = 1
		sprite.position.x = unflippedSpritePos.x
	

func _physics_process(delta):
	pass
