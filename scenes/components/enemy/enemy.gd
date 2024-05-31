extends Node2D
class_name Enemy

@export var speed : int = 100
@export var health : int = 100

@onready var movement = $movement


func take_damage(damage):
	self.health -= damage
	print(damage)


func _ready():
	print("has method: ", self.has_method("take_damage"))


func _process(delta):
	if health < 1:
		queue_free()
	
	
	if Input.is_action_pressed("space"):
		movement.path = Navigation.request_path(self.global_position, Global.player.global_position)
