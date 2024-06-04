extends CharacterBody2D
class_name Player

# movement
@export var health: int
@export var movementSpeed: float
@export var rollSpeed: float
@export var rollDistance: float
@export var isRolling: bool = false
@export var rollDelay: float

@onready var animation = $AnimationPlayer


func take_damage(damage):
	health -= damage
	animation.play("hurt")

func set_global_map():
	var map = get_world_2d().navigation_map
	Navigation.MAP = map


func _ready():
	# set global reference to player // test
	Global.player = self
	set_global_map()

func _physics_process(delta):
	if health <= 0:
		get_tree().quit()
	
	$Camera2D/CanvasLayer/Health.text = str(health)
