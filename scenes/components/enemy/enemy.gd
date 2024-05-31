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
var ticker : int = 0
const physicsTick = 60


func take_damage(damage):
	self.health -= damage
	print(damage)

func _ready():
	pass
	#set_script(actionManager)


func _process(delta):
	if health < 1:
		queue_free()
	

func _physics_process(delta):
	ticker += 1
	
	if ticker >= physicsTick:
		ticker = 0
		movement.path = Navigation.request_path(self.global_position, Global.player.global_position)
