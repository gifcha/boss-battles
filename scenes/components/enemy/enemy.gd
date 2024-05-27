extends Node2D
class_name Enemy

@export var speed : int = 100
@export var health : int = 100

@onready var movement = $movement


func do_damage(damage):
	self.health -= damage
	print(damage)


func _ready():
	pass


func _process(delta):
	if health < 1:
		queue_free()
	
	
	if Input.is_action_pressed("space"):
		movement.path = Navigation.request_path(self.global_position, Global.player.global_position)
