extends CharacterBody2D
class_name Player

# movement
@export var movementSpeed: float
@export var rollSpeed: float
@export var rollDistance: float
@export var isRolling: bool = false
@export var rollDelay: float

@onready var animation = $AnimationPlayer

func _ready():
	# set global reference to player // test
	Global.player = self

func _physics_process(delta):
	pass
