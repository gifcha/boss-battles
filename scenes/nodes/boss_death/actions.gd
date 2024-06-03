extends Node

enum state {idle, move, attack, ability1, ability2, ability3}

@export var decisionTickMax = 240
@export var decisionTickMin = 60
var decisionTick = decisionTickMin


var currentState = state.move


func _ready():
	randomize()


var ticker = 0
func _physics_process(delta):
	ticker += 1
	if ticker >= decisionTick:
		# choose random state
		currentState = randi_range(0, 5)
		ticker = 0
		decisionTick = randi_range(decisionTickMin, decisionTickMax)
