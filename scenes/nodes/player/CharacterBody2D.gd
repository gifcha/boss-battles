extends CharacterBody2D
class_name Player

# movement
@export var movement_speed: float
@export var roll_speed: float
@export var roll_distance: float




func _ready():
	# set global reference to player
	Global.player = self

func _physics_process(delta):
	pass
