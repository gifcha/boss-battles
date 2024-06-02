extends CharacterBody2D
class_name Player

# movement
@export var movementSpeed: float
@export var rollSpeed: float
@export var rollDistance: float
@export var isRolling: bool = false
@export var rollDelay: float

@onready var animation = $AnimationPlayer


func set_global_map():
	var map = get_world_2d().navigation_map
	Navigation.MAP = map


func _ready():
	# set global reference to player // test
	Global.player = self
	set_global_map()

func _physics_process(delta):
	pass
