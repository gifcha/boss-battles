extends Node

enum state {idle, move, attack, ability1, ability2, ability3}

@export var decisionTickMax = 90
@export var decisionTickMin = 60

@onready var boss = get_parent()
var decisionTick = decisionTickMin


@export var currentState = state.move


func _ready():
	randomize()


var ticker = 0
func _physics_process(delta):
	ticker += 1
	
	var distToPlayer = (Global.player.global_position - boss.global_position).length()
	
	if ticker >= decisionTick:
		if distToPlayer > 100:
			if randi_range(0, 2) == 1:
				currentState = state.ability1
			else:
				currentState = state.move
		else:
			currentState = state.attack
		
		ticker = 0
		decisionTick = randi_range(decisionTickMin, decisionTickMax)
